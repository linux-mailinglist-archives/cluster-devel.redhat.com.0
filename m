Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 85099106223
	for <lists+cluster-devel@lfdr.de>; Fri, 22 Nov 2019 07:02:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574402540;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=myn38cXXbSPvlE3G8qbBKWhbY37tu918EUapOtHbxFE=;
	b=GsWGgSdKjZoktgIwS/h0JA57oNdp/xSVey5XW+NFK8RPYpsSJGdUOpOCBaa8rAK0Ccejv4
	X0kCX0JeKkjpFaCtyABfazO/CN0zP5hfQnbPpDJW3caQrgiqIUnZBzhbU9px2svXUIodWv
	qQYslPVgKLs0w4HVKC1rnuu2O47bVmw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-KP7cMXkcN1GW_U1wtQUTcg-1; Fri, 22 Nov 2019 01:02:19 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B82978026B4;
	Fri, 22 Nov 2019 06:02:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 11EB961F30;
	Fri, 22 Nov 2019 06:02:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3E3A14BB78;
	Fri, 22 Nov 2019 06:02:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAM62BYC004142 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 22 Nov 2019 01:02:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 22E472064001; Fri, 22 Nov 2019 06:02:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E6A82064005
	for <cluster-devel@redhat.com>; Fri, 22 Nov 2019 06:02:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F02D3800564
	for <cluster-devel@redhat.com>; Fri, 22 Nov 2019 06:02:08 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-218-JD86-wPnOyO5qBPUlCzHaA-1;
	Fri, 22 Nov 2019 01:02:06 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id A98782070B;
	Fri, 22 Nov 2019 06:02:04 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Fri, 22 Nov 2019 01:00:31 -0500
Message-Id: <20191122060129.4239-32-sashal@kernel.org>
In-Reply-To: <20191122060129.4239-1-sashal@kernel.org>
References: <20191122060129.4239-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-MC-Unique: JD86-wPnOyO5qBPUlCzHaA-1
X-MC-Unique: KP7cMXkcN1GW_U1wtQUTcg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAM62BYC004142
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH AUTOSEL 4.9 33/91] gfs2: take jdata unstuff
	into account in do_grow
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: Bob Peterson <rpeterso@redhat.com>

[ Upstream commit bc0205612bbd4dd4026d4ba6287f5643c37366ec ]

Before this patch, function do_grow would not reserve enough journal
blocks in the transaction to unstuff jdata files while growing them.
This patch adds the logic to add one more block if the file to grow
is jdata.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Reviewed-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/gfs2/bmap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 39af17b407f00..d83e99fa98b3a 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -1236,6 +1236,8 @@ static int do_grow(struct inode *inode, u64 size)
 =09}
=20
 =09error =3D gfs2_trans_begin(sdp, RES_DINODE + RES_STATFS + RES_RG_BIT +
+=09=09=09=09 (unstuff &&
+=09=09=09=09  gfs2_is_jdata(ip) ? RES_JDATA : 0) +
 =09=09=09=09 (sdp->sd_args.ar_quota =3D=3D GFS2_QUOTA_OFF ?
 =09=09=09=09  0 : RES_QUOTA), 0);
 =09if (error)
--=20
2.20.1


