Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6D5F4118F83
	for <lists+cluster-devel@lfdr.de>; Tue, 10 Dec 2019 19:10:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576001403;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=KBeof6vqhNVrRIr89VAJ0Ym+TdZMuTtKrwwMuZLuiKE=;
	b=YCT0ydeoAeHy0kbdSt89Zg8dEYgfHrsr4Ukbw7fi8IJRCtLdO5VoN39CI4vQk8cfRZG4O3
	T/QlP5/LYqF8XawiWXufjJM40bJbQfy8kzpClQBShJfkNYQHYEVPh53O+vH7nZ8VNSRCu4
	r/rjd8AXC3cpHlXvBjKD2h/ek3F6rr8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-VBLk5N5gMJCQeDAlEtxwuA-1; Tue, 10 Dec 2019 13:10:00 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE2CF1B18BC0;
	Tue, 10 Dec 2019 18:09:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 66AE75C1B0;
	Tue, 10 Dec 2019 18:09:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 99A7518089CD;
	Tue, 10 Dec 2019 18:09:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBAI9pf3015203 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 10 Dec 2019 13:09:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4B1596FDDA; Tue, 10 Dec 2019 18:09:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 468E16E3FF
	for <cluster-devel@redhat.com>; Tue, 10 Dec 2019 18:09:49 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0883B18095FF
	for <cluster-devel@redhat.com>; Tue, 10 Dec 2019 18:09:49 +0000 (UTC)
Date: Tue, 10 Dec 2019 13:09:48 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <1531713897.286220.1576001388983.JavaMail.zimbra@redhat.com>
In-Reply-To: <1387805528.286081.1576001299465.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.116.248, 10.4.195.14]
Thread-Topic: gfs2: minor cleanup: remove unneeded variable ret in
	gfs2_jdata_writepage
Thread-Index: g88GNrxdfaOfaQr8nEsrsQC3sfBcMA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 patch] gfs2: minor cleanup: remove unneeded
 variable ret in gfs2_jdata_writepage
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: VBLk5N5gMJCQeDAlEtxwuA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

This patch simply removes variable ret, which is used to store the return
code of its call to __gfs2_jdata_writepage, in favor of just returning the
result directly.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/aops.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index 9c6df721321a..ba83b49ce18c 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -183,14 +183,12 @@ static int gfs2_jdata_writepage(struct page *page, struct writeback_control *wbc
 	struct inode *inode = page->mapping->host;
 	struct gfs2_inode *ip = GFS2_I(inode);
 	struct gfs2_sbd *sdp = GFS2_SB(inode);
-	int ret;
 
 	if (gfs2_assert_withdraw(sdp, gfs2_glock_is_held_excl(ip->i_gl)))
 		goto out;
 	if (PageChecked(page) || current->journal_info)
 		goto out_ignore;
-	ret = __gfs2_jdata_writepage(page, wbc);
-	return ret;
+	return __gfs2_jdata_writepage(page, wbc);
 
 out_ignore:
 	redirty_page_for_writepage(wbc, page);

