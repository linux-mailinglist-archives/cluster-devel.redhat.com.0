Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 50F5F34A457
	for <lists+cluster-devel@lfdr.de>; Fri, 26 Mar 2021 10:31:18 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-pvnLACOdMy29sUcQMJA_YQ-1; Fri, 26 Mar 2021 05:31:15 -0400
X-MC-Unique: pvnLACOdMy29sUcQMJA_YQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E9C0814338;
	Fri, 26 Mar 2021 09:31:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31CED299A1;
	Fri, 26 Mar 2021 09:31:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 67CF74A7C8;
	Fri, 26 Mar 2021 09:31:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12Q9C1wM012275 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 26 Mar 2021 05:12:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D2721FA742; Fri, 26 Mar 2021 09:12:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9805FA74E
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 09:11:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12E4680D2B8
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 09:11:59 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
	[209.85.218.53]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-195-mp0oWY1QPy2-4Tp93RH44w-1; Fri, 26 Mar 2021 05:11:55 -0400
X-MC-Unique: mp0oWY1QPy2-4Tp93RH44w-1
Received: by mail-ej1-f53.google.com with SMTP id r12so7316143ejr.5
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 02:11:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=d5DZ45h/RpaWq13JyZLjT9LQ1ZqjNiweLlYOo/ZaYXM=;
	b=NhAEVps9kT4x1T7DTgS1XGZIEQd4kySAMJp93WsgcDahd1txGFER89fAlHwqSU/uae
	/LCdvEGykTf6tBUvDAlC41Im9zaOaFJXXH2idGnDOcZf+yqwNuQUQ2aWmNc+2B+3a8C1
	mNVLSDCjxiJHk4bzIgjIocby4XdxLDjVqvMpaGPTW7af4i70kpgDBir6OY3inSsLBQGl
	lwXybYnGj4jWZYm2bnuilKw0Zj5pgAGXFKBGYTucIXAxu1OHQVWZe2jTJSRmEXmglOOo
	8amErobmZURr8FBg8I6vrRNpWiyhEMLzhCUDb7NngaE/Whnxy5gpytNzPymjDr63bXLG
	XFDQ==
X-Gm-Message-State: AOAM533aTWseRoqmVudABL3YG1mF6mUC3rMsKOQjc1R4LYqUZAbmqTaJ
	QByryurL9iKGxnurhGP1lIS9nBKIp42oSg==
X-Google-Smtp-Source: ABdhPJwNkJzoSyBqRRjCKPX1E4A0iDVoJ3n3WyHamx41u8DVwNPy/Qr4ZE9aLevdZdE2AUs6ce0vYA==
X-Received: by 2002:a17:907:76a3:: with SMTP id
	jw3mr14379620ejc.353.1616749914533; 
	Fri, 26 Mar 2021 02:11:54 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
	by smtp.gmail.com with ESMTPSA id r13sm3895645edy.3.2021.03.26.02.11.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 26 Mar 2021 02:11:54 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 26 Mar 2021 09:11:33 +0000
Message-Id: <20210326091151.311647-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Fri, 26 Mar 2021 05:31:04 -0400
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH 00/18] Rid W=1 warnings from GFS2
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

This set is part of a larger effort attempting to clean-up W=1
kernel builds, which are currently overwhelmingly riddled with
niggly little warnings.

Lee Jones (18):
  fs: gfs2: dir: Finish off mostly complete headers demote others
  fs: gfs2: xattr: Help out some kernel-doc header demote non-conformant
    ones
  fs: gfs2: bmap: Demote half-complete kernel-doc headers fix others
  fs: gfs2: glops: Fix a couple of kernel-doc misdemeanours demote
    others
  fs: gfs2: log: Fix a couple of param descriptions and demote
    non-conformant headers
  fs: gfs2: lops: Help out worthy kernel-doc headers and demote others
  fs: gfs2: glock: Fix some deficient kernel-doc headers and demote
    non-conformant ones
  fs: gfs2: aops: Fix a little potential doc-rot
  fs: gfs2: meta_io: Add missing description for 'rahead' param
  fs: gfs2: inode: Fix worthy function headers demote others
  fs: gfs2: file: Strip out superflouous param description and demote
    kernel-doc abuse
  fs: gfs2: ops_fstype: Fix a little doc-rot
  fs: gfs2: quota: Fix incorrect param name in 'gfs2_quotad'
  fs: gfs2: rgrp: Fix a few kernel-doc misdemeanours
  fs: gfs2: recovery: Provide missing param descriptions and remove one
    other
  fs: gfs2: super: Fix kernel-doc issues where feasible demote one other
  fs: gfs2: util: Fix one conformant kernel-doc header and demote a
    bunch of abuses
  fs: gfs2: lock_dlm: Demote incomplete kernel-doc header

 fs/gfs2/aops.c       |  5 +----
 fs/gfs2/bmap.c       |  4 ++--
 fs/gfs2/dir.c        | 35 +++++++++++++----------------------
 fs/gfs2/file.c       |  3 +--
 fs/gfs2/glock.c      |  9 ++++-----
 fs/gfs2/glops.c      | 18 ++++++------------
 fs/gfs2/inode.c      | 22 ++++++++++++----------
 fs/gfs2/lock_dlm.c   |  3 +--
 fs/gfs2/log.c        | 11 ++++-------
 fs/gfs2/lops.c       | 13 +++++++------
 fs/gfs2/meta_io.c    |  1 +
 fs/gfs2/ops_fstype.c |  7 ++-----
 fs/gfs2/quota.c      |  2 +-
 fs/gfs2/recovery.c   |  3 ++-
 fs/gfs2/rgrp.c       |  4 +++-
 fs/gfs2/super.c      | 13 ++++++-------
 fs/gfs2/util.c       | 19 ++++++++++---------
 fs/gfs2/xattr.c      | 25 +++++++------------------
 18 files changed, 83 insertions(+), 114 deletions(-)

Cc: Andreas Gruenbacher <agruenba@redhat.com>
Cc: Bob Peterson <rpeterso@redhat.com>
Cc: cluster-devel@redhat.com
-- 
2.27.0

