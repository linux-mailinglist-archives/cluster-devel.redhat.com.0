Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C766A40EAAF
	for <lists+cluster-devel@lfdr.de>; Thu, 16 Sep 2021 21:10:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631819441;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wTn8f4lOdyVLpe7d68o8yeqKyUc+Jx0q1iureu0ejeg=;
	b=eMJuqoTW558j1TCYzHbIcu2gwxLnxLnrmR57G4zIvmjbSGFgFPyh+2akG+Dn2zf1tszeVQ
	TayRLpBdJfCjVD0I7lBD0+tE9mmA6XL6GfTkOUxFR7S4H2zHgAkKJOhfnWiGFgxsPUrb2t
	LuAKa7p4OjFUpiFF06s0ToiklTT1gbg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-OlGiM1jjN1esXV58RkxHaw-1; Thu, 16 Sep 2021 15:10:40 -0400
X-MC-Unique: OlGiM1jjN1esXV58RkxHaw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42DE41006AAB;
	Thu, 16 Sep 2021 19:10:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 624BE60C25;
	Thu, 16 Sep 2021 19:10:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B8B8C4E58E;
	Thu, 16 Sep 2021 19:10:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18GJAaEd021589 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 16 Sep 2021 15:10:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0FFFD5C1CF; Thu, 16 Sep 2021 19:10:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-114-63.phx2.redhat.com [10.3.114.63])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CF0D05C1C5
	for <cluster-devel@redhat.com>; Thu, 16 Sep 2021 19:10:35 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 16 Sep 2021 14:09:59 -0500
Message-Id: <20210916191003.105866-3-rpeterso@redhat.com>
In-Reply-To: <20210916191003.105866-1-rpeterso@redhat.com>
References: <20210916191003.105866-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH v2 2/6] gfs2: Add GL_SKIP holder flag
	to dump_holder
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Somehow the GL_SKIP flag was missed when dumping glock holders.
This patch adds it to function hflags2str. I added it at the end because
I wanted Holder and Skip flags together to read "Hs" rather than "sH"
to avoid confusion with "Shared" ("SH") holder state.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index e0eaa9cf9fb6..6144d7fe28e6 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -2076,6 +2076,8 @@ static const char *hflags2str(char *buf, u16 flags, unsigned long iflags)
 		*p++ = 'H';
 	if (test_bit(HIF_WAIT, &iflags))
 		*p++ = 'W';
+	if (flags & GL_SKIP)
+		*p++ = 's';
 	*p = 0;
 	return buf;
 }
-- 
2.31.1

