Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9328D3F9CD8
	for <lists+cluster-devel@lfdr.de>; Fri, 27 Aug 2021 18:50:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630083047;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gFRdiyPuactUcLg/wErn/XbBvh4nZFvYbNfA2glabKM=;
	b=Uw/xqB4e67sjUK4EimTGl/WUzcQ4ywJjs6K2Nh/6wQjn3EgcZmMctG77jWRK7vOQmV6iSt
	Yt42GIby7TWh9EoW6u8phBZ+M3wwEWkIza2kvVGbcw35KWhHEG14/C/HGWzAwcUHJRvuhQ
	s5ZuNcWzEG5/k8UqIAVIDth9Os0Czgc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-kupLwlogOCezaclYTAgWxQ-1; Fri, 27 Aug 2021 12:50:46 -0400
X-MC-Unique: kupLwlogOCezaclYTAgWxQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC5CB101C8A5;
	Fri, 27 Aug 2021 16:50:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CDB145D9FC;
	Fri, 27 Aug 2021 16:50:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BD0384BB7C;
	Fri, 27 Aug 2021 16:50:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17RGofGb005968 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 27 Aug 2021 12:50:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EB6DC60C81; Fri, 27 Aug 2021 16:50:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.194.206])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EB82C60C82;
	Fri, 27 Aug 2021 16:50:29 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christoph Hellwig <hch@infradead.org>,
	"Darrick J. Wong" <djwong@kernel.org>
Date: Fri, 27 Aug 2021 18:49:16 +0200
Message-Id: <20210827164926.1726765-10-agruenba@redhat.com>
In-Reply-To: <20210827164926.1726765-1-agruenba@redhat.com>
References: <20210827164926.1726765-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, ocfs2-devel@oss.oracle.com
Subject: [Cluster-devel] [PATCH v7 09/19] gfs2: Remove redundant check from
	gfs2_glock_dq
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Bob Peterson <rpeterso@redhat.com>

In function gfs2_glock_dq, it checks to see if this is the fast path.
Before this patch, it checked both "find_first_holder(gl) == NULL" and
list_empty(&gl->gl_holders), which is redundant. If gl_holders is empty
then find_first_holder must return NULL. This patch removes the
redundancy.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index fd280b6c37ce..f24db2ececfb 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -1514,12 +1514,11 @@ void gfs2_glock_dq(struct gfs2_holder *gh)
 
 	list_del_init(&gh->gh_list);
 	clear_bit(HIF_HOLDER, &gh->gh_iflags);
-	if (find_first_holder(gl) == NULL) {
-		if (list_empty(&gl->gl_holders) &&
-		    !test_bit(GLF_PENDING_DEMOTE, &gl->gl_flags) &&
-		    !test_bit(GLF_DEMOTE, &gl->gl_flags))
-			fast_path = 1;
-	}
+	if (list_empty(&gl->gl_holders) &&
+	    !test_bit(GLF_PENDING_DEMOTE, &gl->gl_flags) &&
+	    !test_bit(GLF_DEMOTE, &gl->gl_flags))
+		fast_path = 1;
+
 	if (!test_bit(GLF_LFLUSH, &gl->gl_flags) && demote_ok(gl))
 		gfs2_glock_add_to_lru(gl);
 
-- 
2.26.3

