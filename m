Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 54142F46E2
	for <lists+cluster-devel@lfdr.de>; Fri,  8 Nov 2019 12:46:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573213570;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tMlCqhyHlOmwAloG5iCDE5mGFvoonCefAnGjSmM+RNw=;
	b=TAAof59UlsvYJ0HcvDnMo+4A6K82//Hw8+/JUjUNJeBObjpYvuRzHy3qlun+d36mYbQMLe
	4/2dVW2yzEN6YSTWp/j9D35sGjQI4dY0658sQUFDX7EFVvVRfNh+EbZTReT3izKPmyfEuV
	AJdp+y2myftFg1NjtzT2hU7uC1BMJ2E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-KbpYqioOPm2z_GWMagm5Kg-1; Fri, 08 Nov 2019 06:46:08 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 780D1FB;
	Fri,  8 Nov 2019 11:46:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6661A5C548;
	Fri,  8 Nov 2019 11:46:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5034F4E56C;
	Fri,  8 Nov 2019 11:46:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA8Bk4FQ031851 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 8 Nov 2019 06:46:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3987D1001DF0; Fri,  8 Nov 2019 11:46:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx30.extmail.prod.ext.phx2.redhat.com
	[10.5.110.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 306A51001DC2;
	Fri,  8 Nov 2019 11:46:01 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EE5151C0E;
	Fri,  8 Nov 2019 11:46:00 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E883421D82;
	Fri,  8 Nov 2019 11:45:59 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Fri,  8 Nov 2019 06:44:50 -0500
Message-Id: <20191108114545.15351-9-sashal@kernel.org>
In-Reply-To: <20191108114545.15351-1-sashal@kernel.org>
References: <20191108114545.15351-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.71]);
	Fri, 08 Nov 2019 11:46:01 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]);
	Fri, 08 Nov 2019 11:46:01 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'sashal@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.101  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<sashal@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.71
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH AUTOSEL 4.9 09/64] gfs2: Don't set
	GFS2_RDF_UPTODATE when the lvb is updated
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
X-MC-Unique: KbpYqioOPm2z_GWMagm5Kg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: Bob Peterson <rpeterso@redhat.com>

[ Upstream commit 4f36cb36c9d14340bb200d2ad9117b03ce992cfe ]

The GFS2_RDF_UPTODATE flag in the rgrp is used to determine when
a rgrp buffer is valid. It's cleared when the glock is invalidated,
signifying that the buffer data is now invalid. But before this
patch, function update_rgrp_lvb was setting the flag when it
determined it had a valid lvb. But that's an invalid assumption:
just because you have a valid lvb doesn't mean you have valid
buffers. After all, another node may have made the lvb valid,
and this node just fetched it from the glock via dlm.

Consider this scenario:
1. The file system is mounted with RGRPLVB option.
2. In gfs2_inplace_reserve it locks the rgrp glock EX, but thanks
   to GL_SKIP, it skips the gfs2_rgrp_bh_get.
3. Since loops =3D=3D 0 and the allocation target (ap->target) is
   bigger than the largest known chunk of blocks in the rgrp
   (rs->rs_rbm.rgd->rd_extfail_pt) it skips that rgrp and bypasses
   the call to gfs2_rgrp_bh_get there as well.
4. update_rgrp_lvb sees the lvb MAGIC number is valid, so bypasses
   gfs2_rgrp_bh_get, but it still sets sets GFS2_RDF_UPTODATE due
   to this invalid assumption.
5. The next time update_rgrp_lvb is called, it sees the bit is set
   and just returns 0, assuming both the lvb and rgrp are both
   uptodate. But since this is a smaller allocation, or space has
   been freed by another node, thus adjusting the lvb values,
   it decides to use the rgrp for allocations, with invalid rd_free
   due to the fact it was never updated.

This patch changes update_rgrp_lvb so it doesn't set the UPTODATE
flag anymore. That way, it has no choice but to fetch the latest
values.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/gfs2/rgrp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 0731267072706..f77a38755aea6 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -1211,7 +1211,7 @@ static int update_rgrp_lvb(struct gfs2_rgrpd *rgd)
 =09rl_flags =3D be32_to_cpu(rgd->rd_rgl->rl_flags);
 =09rl_flags &=3D ~GFS2_RDF_MASK;
 =09rgd->rd_flags &=3D GFS2_RDF_MASK;
-=09rgd->rd_flags |=3D (rl_flags | GFS2_RDF_UPTODATE | GFS2_RDF_CHECK);
+=09rgd->rd_flags |=3D (rl_flags | GFS2_RDF_CHECK);
 =09if (rgd->rd_rgl->rl_unlinked =3D=3D 0)
 =09=09rgd->rd_flags &=3D ~GFS2_RDF_CHECK;
 =09rgd->rd_free =3D be32_to_cpu(rgd->rd_rgl->rl_free);
--=20
2.20.1

