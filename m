Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id E9EC141C558
	for <lists+cluster-devel@lfdr.de>; Wed, 29 Sep 2021 15:16:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632921400;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fTeWnjHVEzsMNuW5AsUaDCDg+wQavDT9VYNffR8l9Vg=;
	b=eQ9iKB7EWPc+xB6SSCU9zWFlO7wc7ReV50nKzjM5GlKpBEjQ1QSAZEXmR9nTZZEJF/lzNW
	leG5dTbb4x7l/kqXHp3EO6Yu2rWPd1Yrm1vkSujhM1K6Vl1ks1XorPzqywyZcmNalkh46i
	1s7Q56/KhhlOow0sbVKT0zQpCyr4GDM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-ge3FbxVHOUSVEk-j0Eva3Q-1; Wed, 29 Sep 2021 09:16:38 -0400
X-MC-Unique: ge3FbxVHOUSVEk-j0Eva3Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81C75835DE1;
	Wed, 29 Sep 2021 13:16:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BB0C18432;
	Wed, 29 Sep 2021 13:16:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 11047180598A;
	Wed, 29 Sep 2021 13:16:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18TDGHQI028221 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 29 Sep 2021 09:16:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 148321816A; Wed, 29 Sep 2021 13:16:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-114-127.phx2.redhat.com [10.3.114.127])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D7A795D9C6
	for <cluster-devel@redhat.com>; Wed, 29 Sep 2021 13:16:16 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 29 Sep 2021 08:16:16 -0500
Message-Id: <20210929131616.192330-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Save caller ip in gfs2_glock_nq_init
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Before this patch, when a glock was locked by function gfs2_glock_nq_init,
it initializes the holder gh_ip (return address) as gfs2_glock_nq_init.
That made it extremely difficult to track down problems because many
functions call gfs2_glock_nq_init. This patch changes the function so
that it saves gh_ip from the caller of gfs2_glock_nq_init, which makes
it easy to backtrack which holder took the lock.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/gfs2/glock.h b/fs/gfs2/glock.h
index 699c5e95006a..8a09379dbf66 100644
--- a/fs/gfs2/glock.h
+++ b/fs/gfs2/glock.h
@@ -240,6 +240,7 @@ static inline int gfs2_glock_nq_init(struct gfs2_glock *gl,
 	int error;
 
 	gfs2_holder_init(gl, state, flags, gh);
+	gh->gh_ip = _RET_IP_;
 
 	error = gfs2_glock_nq(gh);
 	if (error)
-- 
2.31.1

