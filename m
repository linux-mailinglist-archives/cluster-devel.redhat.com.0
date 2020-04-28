Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 181881BB4B4
	for <lists+cluster-devel@lfdr.de>; Tue, 28 Apr 2020 05:30:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588044639;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PC8ODN+nhmqhjcYYgcfvGsH/iayYH/xQNZEyW0Q8V8k=;
	b=c6vPBYpJxv2Hgo/nAQyRTuQo8yuQbQ7QbTZEMctmRIMSoN3KbCI/vdSA3eWDwL0q9h1a4o
	OdoPLXDjTTRjLt3aozLU+Ofy4efFwsyNMtDvXy0QolIaS6y70eDo982AXweZjmWbt0BR0m
	rGsX7aubqpZwbcK1QW3Oh1KJja2Mvk4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-JBmSpr14N26R8P0LIT4pRA-1; Mon, 27 Apr 2020 23:30:37 -0400
X-MC-Unique: JBmSpr14N26R8P0LIT4pRA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4024107ACF2;
	Tue, 28 Apr 2020 03:30:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B38521001925;
	Tue, 28 Apr 2020 03:30:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 455234CAA0;
	Tue, 28 Apr 2020 03:30:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03S3UL23025651 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 27 Apr 2020 23:30:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 24C5FAFD55; Tue, 28 Apr 2020 03:30:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 21403AFD54
	for <cluster-devel@redhat.com>; Tue, 28 Apr 2020 03:30:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E25180CDAE
	for <cluster-devel@redhat.com>; Tue, 28 Apr 2020 03:30:18 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-321-xn4BmU4OONq8RgJGhFnj7w-1; Mon, 27 Apr 2020 23:30:11 -0400
X-MC-Unique: xn4BmU4OONq8RgJGhFnj7w-1
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id D54AAEE4D4C2439DAFE6;
	Tue, 28 Apr 2020 11:30:05 +0800 (CST)
Received: from huawei.com (10.175.105.27) by DGGEMS410-HUB.china.huawei.com
	(10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Tue, 28 Apr 2020
	11:29:59 +0800
From: Wu Bo <wubo40@huawei.com>
To: <rpeterso@redhat.com>, <agruenba@redhat.com>
Date: Tue, 28 Apr 2020 11:29:05 +0800
Message-ID: <1588044545-59405-1-git-send-email-wubo40@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.105.27]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03S3UL23025651
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linfeilong@huawei.com,
	linux-kernel@vger.kernel.org, wubo40@huawei.com, liuzhiqiang26@huawei.com
Subject: [Cluster-devel] [PATCH] fs/gfs2:lock a spinlock always before
	returning from do_xmote()
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

The call stack is as follows:
finish_xmote()
        ...
        spin_lock(&gl->gl_lockref.lock);
        ...
=09--> do_xmote()
            spin_unlock(&gl->gl_lockref.lock);
            ...
            return;
        ...
        spin_unlock(&gl->gl_lockref.lock);
          =20
do_xmote function needs to be locked before returning,
Otherwise, there will be a double release lock in finish_xmote() function.

Signed-off-by: Wu Bo <wubo40@huawei.com>
---
 fs/gfs2/glock.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 29f9b66..7129d10 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -613,6 +613,7 @@ static void do_xmote(struct gfs2_glock *gl, struct gfs2=
_holder *gh, unsigned int
 =09=09=09=09fs_err(sdp, "Error %d syncing glock \n", ret);
 =09=09=09=09gfs2_dump_glock(NULL, gl, true);
 =09=09=09}
+=09=09=09spin_lock(&gl->gl_lockref.lock);
 =09=09=09return;
 =09=09}
 =09}
--=20
1.8.3.1


