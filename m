Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id BF7DF1F1CB4
	for <lists+cluster-devel@lfdr.de>; Mon,  8 Jun 2020 18:02:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591632155;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RN2RjpzBE8dqP3mmAtSQLb9gA4C0Yz1L52+fzBxeYTg=;
	b=JBJZSvh5qxQYaS0EVGAqCE5Q1VhTTlG2bjSenut7GWIV+aWnUpNAZ8LI8Xt3gbFXF7miWd
	NMz73LP1WAzgM7pO5YbkW+enF8oVkYtW3SAHURLergDUZXjsH2AZ7xeG20rQaseArRJ/SV
	WsFJmGsOGgh4T39sikkOU/pgv1gz7yw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-3QmDl6JdPE2v0K2vQtLfjg-1; Mon, 08 Jun 2020 12:02:28 -0400
X-MC-Unique: 3QmDl6JdPE2v0K2vQtLfjg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D305B800053;
	Mon,  8 Jun 2020 16:02:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C3FE57E577;
	Mon,  8 Jun 2020 16:02:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B08EFB3491;
	Mon,  8 Jun 2020 16:02:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 058G0lth011609 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 8 Jun 2020 12:00:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 86D518926C; Mon,  8 Jun 2020 16:00:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.195.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8ABF8648DB;
	Mon,  8 Jun 2020 16:00:46 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon,  8 Jun 2020 18:00:21 +0200
Message-Id: <20200608160039.549204-3-agruenba@redhat.com>
In-Reply-To: <20200608160039.549204-1-agruenba@redhat.com>
References: <20200608160039.549204-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 02/20] gfs2: Don't ignore inode write errors
	during inode_go_sync
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

From: Bob Peterson <rpeterso@redhat.com>

Before for this patch, function inode_go_sync ignored io errors
during inode_go_sync, overwriting them with metadata write errors:

		error = filemap_fdatawait(mapping);
		mapping_set_error(mapping, error);
	}
	error = filemap_fdatawait(metamapping);
	...
	return error;

So any errors returned by the inode write would be forgotten if the
metadata write succeeded. This patch still does both writes, but
only sets error if it's still zero. That way, any errors will be
reported by to the caller, do_xmote, which will take appropriate
action and report the error.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glops.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 9e9c7a4b8c66..4862dae868a2 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -268,7 +268,7 @@ static int inode_go_sync(struct gfs2_glock *gl)
 	struct gfs2_inode *ip = gfs2_glock2inode(gl);
 	int isreg = ip && S_ISREG(ip->i_inode.i_mode);
 	struct address_space *metamapping = gfs2_glock2aspace(gl);
-	int error = 0;
+	int error = 0, ret;
 
 	if (isreg) {
 		if (test_and_clear_bit(GIF_SW_PAGED, &ip->i_flags))
@@ -289,8 +289,10 @@ static int inode_go_sync(struct gfs2_glock *gl)
 		error = filemap_fdatawait(mapping);
 		mapping_set_error(mapping, error);
 	}
-	error = filemap_fdatawait(metamapping);
-	mapping_set_error(metamapping, error);
+	ret = filemap_fdatawait(metamapping);
+	mapping_set_error(metamapping, ret);
+	if (!error)
+		error = ret;
 	gfs2_ail_empty_gl(gl);
 	/*
 	 * Writeback of the data mapping may cause the dirty flag to be set
-- 
2.26.2

