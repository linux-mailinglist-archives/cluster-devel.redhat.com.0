Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 83026338E0A
	for <lists+cluster-devel@lfdr.de>; Fri, 12 Mar 2021 13:59:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615553994;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=J4ydYFA1w2xWqjPIOixBU9Ka2i3iaJW26fFmtI1Yvj4=;
	b=Hxz7YSyqob/1i7xtrwR/6MVmA9qTZpe7uBYCTM8V7LVIQ+CCnMiTubx5U9xbh4yug5yImK
	P6SiTsuatinjhgG/aXb1UxeU7WbvjcDyirKe3tyl1MtITJCUiLxoTInGktx+niPjISTMRc
	JU/HMcMsmAXb3j5qUQnUxvObMPxcKf8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-3-_bIT3qMZeO77TvnqzzwA-1; Fri, 12 Mar 2021 07:59:53 -0500
X-MC-Unique: 3-_bIT3qMZeO77TvnqzzwA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE21C1015C85;
	Fri, 12 Mar 2021 12:59:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C1C0859443;
	Fri, 12 Mar 2021 12:59:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AF9811800657;
	Fri, 12 Mar 2021 12:59:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12CCwvGi032386 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 12 Mar 2021 07:58:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C17739CA0; Fri, 12 Mar 2021 12:58:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BCC0E60636
	for <cluster-devel@redhat.com>; Fri, 12 Mar 2021 12:58:54 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B1E9418095C9
	for <cluster-devel@redhat.com>; Fri, 12 Mar 2021 12:58:54 +0000 (UTC)
Date: Fri, 12 Mar 2021 07:58:54 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <950682241.62253247.1615553934658.JavaMail.zimbra@redhat.com>
In-Reply-To: <1512487658.62253208.1615553878997.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.166, 10.4.195.13]
Thread-Topic: gfs2: bypass signal_our_withdraw if no journal
Thread-Index: twKj0PKmtVncSEhCmf8B/c51RdPkAg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: bypass signal_our_withdraw if no
	journal
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Before this patch, function signal_our_withdraw referenced the journal
inode immediately. But corrupt file systems may have some invalid
journals, in which case our attempt to read it in will withdraw and the
resulting signal_our_withdraw would dereference the NULL value.

This patch adds a check to signal_our_withdraw so that if the journal
has not yet been initialized, it simply returns and does the old-style
withdraw.

Thanks, Andy Price, for his analysis.

Reported-by: syzbot+50a8a9cf8127f2c6f5df@syzkaller.appspotmail.com
Fixes: 601ef0d52e96 ("gfs2: Force withdraw to replay journals and wait for it
to finish")
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/util.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index 58743315cda9..4f034b87b427 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -119,17 +119,22 @@ void gfs2_freeze_unlock(struct gfs2_holder *freeze_gh)
 static void signal_our_withdraw(struct gfs2_sbd *sdp)
 {
 	struct gfs2_glock *live_gl = sdp->sd_live_gh.gh_gl;
-	struct inode *inode = sdp->sd_jdesc->jd_inode;
-	struct gfs2_inode *ip = GFS2_I(inode);
-	struct gfs2_glock *i_gl = ip->i_gl;
-	u64 no_formal_ino = ip->i_no_formal_ino;
+	struct inode *inode;
+	struct gfs2_inode *ip;
+	struct gfs2_glock *i_gl;
+	u64 no_formal_ino;
 	int log_write_allowed = test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
 	int ret = 0;
 	int tries;
 
-	if (test_bit(SDF_NORECOVERY, &sdp->sd_flags))
+	if (test_bit(SDF_NORECOVERY, &sdp->sd_flags) || !sdp->sd_jdesc)
 		return;
 
+	inode = sdp->sd_jdesc->jd_inode;
+	ip = GFS2_I(inode);
+	i_gl = ip->i_gl;
+	no_formal_ino = ip->i_no_formal_ino;
+
 	/* Prevent any glock dq until withdraw recovery is complete */
 	set_bit(SDF_WITHDRAW_RECOVERY, &sdp->sd_flags);
 	/*

