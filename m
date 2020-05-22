Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 37FF61DEA09
	for <lists+cluster-devel@lfdr.de>; Fri, 22 May 2020 16:52:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590159137;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kEeQ71LoVFlDcSOzd9WRpStC47BerKDsgscJ253gSbI=;
	b=X8L8XKmxmi/laCb2cSEOMdzkD4SRck/g2Jzw6A3+RWOVYK2tu9ctUuC1ThRmTNKgGA9Dif
	p2Dfn6/XFqXFhjfDJOPoMiSowM17+Sdylmx/vS5RXmGy5qOShQgx9r2uxwXR6wO0oqnsLV
	MgqX6Yew3RpwVctxIukknwzz68tpeCY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-FZ25dFI0MU-tmiKwhy9xwA-1; Fri, 22 May 2020 10:52:13 -0400
X-MC-Unique: FZ25dFI0MU-tmiKwhy9xwA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD46E107ACCD;
	Fri, 22 May 2020 14:52:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD1D982A24;
	Fri, 22 May 2020 14:52:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 98CB31809543;
	Fri, 22 May 2020 14:52:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04MEq9wh009294 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 22 May 2020 10:52:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0177A1067CC6; Fri, 22 May 2020 14:52:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E9EE91067CC1
	for <cluster-devel@redhat.com>; Fri, 22 May 2020 14:52:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8BA9186E3A6
	for <cluster-devel@redhat.com>; Fri, 22 May 2020 14:52:08 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-255-v5e5eW0-M_iTI6F9xvcKgQ-1;
	Fri, 22 May 2020 10:52:02 -0400
X-MC-Unique: v5e5eW0-M_iTI6F9xvcKgQ-1
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id AE1B02224A;
	Fri, 22 May 2020 14:52:00 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Fri, 22 May 2020 10:51:52 -0400
Message-Id: <20200522145157.435215-3-sashal@kernel.org>
In-Reply-To: <20200522145157.435215-1-sashal@kernel.org>
References: <20200522145157.435215-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04MEq9wh009294
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH AUTOSEL 4.9 3/8] gfs2: move privileged user
	check to gfs2_quota_lock_check
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

From: Bob Peterson <rpeterso@redhat.com>

[ Upstream commit 4ed0c30811cb4d30ef89850b787a53a84d5d2bcb ]

Before this patch, function gfs2_quota_lock checked if it was called
from a privileged user, and if so, it bypassed the quota check:
superuser can operate outside the quotas.
That's the wrong place for the check because the lock/unlock functions
are separate from the lock_check function, and you can do lock and
unlock without actually checking the quotas.

This patch moves the check to gfs2_quota_lock_check.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/gfs2/quota.c | 3 +--
 fs/gfs2/quota.h | 3 ++-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index c2ca9566b764..fb9b1d702351 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -1039,8 +1039,7 @@ int gfs2_quota_lock(struct gfs2_inode *ip, kuid_t uid, kgid_t gid)
 	u32 x;
 	int error = 0;
 
-	if (capable(CAP_SYS_RESOURCE) ||
-	    sdp->sd_args.ar_quota != GFS2_QUOTA_ON)
+	if (sdp->sd_args.ar_quota != GFS2_QUOTA_ON)
 		return 0;
 
 	error = gfs2_quota_hold(ip, uid, gid);
diff --git a/fs/gfs2/quota.h b/fs/gfs2/quota.h
index 836f29480be6..e3a6e2404d11 100644
--- a/fs/gfs2/quota.h
+++ b/fs/gfs2/quota.h
@@ -47,7 +47,8 @@ static inline int gfs2_quota_lock_check(struct gfs2_inode *ip,
 	int ret;
 
 	ap->allowed = UINT_MAX; /* Assume we are permitted a whole lot */
-	if (sdp->sd_args.ar_quota == GFS2_QUOTA_OFF)
+	if (capable(CAP_SYS_RESOURCE) ||
+	    sdp->sd_args.ar_quota == GFS2_QUOTA_OFF)
 		return 0;
 	ret = gfs2_quota_lock(ip, NO_UID_QUOTA_CHANGE, NO_GID_QUOTA_CHANGE);
 	if (ret)
-- 
2.25.1


