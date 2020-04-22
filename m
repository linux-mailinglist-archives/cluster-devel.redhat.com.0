Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id D86E21B4DC9
	for <lists+cluster-devel@lfdr.de>; Wed, 22 Apr 2020 21:57:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587585420;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=UxtY8nw/1KmZmyqUrt8ShB4JACUF2rW0DI16kR20J1E=;
	b=IODkjR8NyiRb0T35YPguqPKkWYnFa8tH64Q08j2TQf6h8AMXJbxiussyg0UclsRAAWNWys
	to0c79lHS9AA9UIGXuKvoiYL8ClKFko8rCRuDMT28dPWrpuQjVgjwxzMK0qQg4qdMan2gs
	FJlRE7skSmImGY+PvBldigBpezs7/h4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-JEnmRWyUP2ei7up_bVNk7A-1; Wed, 22 Apr 2020 15:56:58 -0400
X-MC-Unique: JEnmRWyUP2ei7up_bVNk7A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE04D18C8C21;
	Wed, 22 Apr 2020 19:56:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27EE1600DB;
	Wed, 22 Apr 2020 19:56:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 52A67941C8;
	Wed, 22 Apr 2020 19:56:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03MJuZ7L004107 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 22 Apr 2020 15:56:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 885915DA7D; Wed, 22 Apr 2020 19:56:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82AC55E240
	for <cluster-devel@redhat.com>; Wed, 22 Apr 2020 19:56:32 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F36A71809540
	for <cluster-devel@redhat.com>; Wed, 22 Apr 2020 19:56:31 +0000 (UTC)
Date: Wed, 22 Apr 2020 15:56:31 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <964003633.23378257.1587585391922.JavaMail.zimbra@redhat.com>
In-Reply-To: <1748449371.23378235.1587585356740.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.113.53, 10.4.195.30]
Thread-Topic: gfs2: fix withdraw sequence deadlock
Thread-Index: 3mAIyog37bwxOOfL4R0KZUqjZiS/Gg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: fix withdraw sequence deadlock
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

This patch fixes a deadlock in the withdraw recovery sequence.
Before this patch, any attempt to map an area of the journal inode
except for the inode itself, resulted in -EIO because gfs2_meta_read
checked for blkno != sdp->sd_jdesc->jd_no_addr. But function
signal_our_withdraw repeatedly calls check_journal_clean which reads
the metadata (both dinode and indirect blocks) to see if the entire
journal is mapped. When it returned -EIO to its caller, that would
bubble back up and cause a consistency error, which would try to
withdraw-from-withdraw, which results in a deadlock.

This patch changes to test in gfs2_meta_read so other metadata reads
for the journal are not rejected out-of-hand with -EIO. It accomplishes
this by checking for the journal inode glock which will be the same
for all blocks in the journal. That allows check_journal_clean to do
its work while its journal is recovered without trying to withdraw
recursively.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/meta_io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/meta_io.c b/fs/gfs2/meta_io.c
index 4b72abcf83b2..c6d885dbe5f0 100644
--- a/fs/gfs2/meta_io.c
+++ b/fs/gfs2/meta_io.c
@@ -252,7 +252,7 @@ int gfs2_meta_read(struct gfs2_glock *gl, u64 blkno, int flags,
 	int num = 0;
 
 	if (unlikely(gfs2_withdrawn(sdp)) &&
-	    (!sdp->sd_jdesc || (blkno != sdp->sd_jdesc->jd_no_addr))) {
+	    (!sdp->sd_jdesc || (gl != sdp->sd_jinode_gl))) {
 		*bhp = NULL;
 		return -EIO;
 	}

