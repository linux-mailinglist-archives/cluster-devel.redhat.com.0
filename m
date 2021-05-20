Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 630B038AD9D
	for <lists+cluster-devel@lfdr.de>; Thu, 20 May 2021 14:08:02 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-FSwd6IAkNOKI1VHIVXVHjQ-1; Thu, 20 May 2021 08:08:00 -0400
X-MC-Unique: FSwd6IAkNOKI1VHIVXVHjQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C00B2180FD61;
	Thu, 20 May 2021 12:07:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B431760C03;
	Thu, 20 May 2021 12:07:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A2BD35F9B1;
	Thu, 20 May 2021 12:07:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14KC0x5P028117 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 20 May 2021 08:00:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B23861054FDA; Thu, 20 May 2021 12:00:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD05410D14E4
	for <cluster-devel@redhat.com>; Thu, 20 May 2021 12:00:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3BC118E0921
	for <cluster-devel@redhat.com>; Thu, 20 May 2021 12:00:48 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-41-QuIo0G6vO8msf10jIgidYg-1; Thu, 20 May 2021 08:00:46 -0400
X-MC-Unique: QuIo0G6vO8msf10jIgidYg-1
Received: by mail-wr1-f51.google.com with SMTP id z17so17361491wrq.7
	for <cluster-devel@redhat.com>; Thu, 20 May 2021 05:00:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QTjS1lV5/2FTT6PaKbPLNrY5CGW03uQdFbkA9bdxFfg=;
	b=DXHwXR17gLdGVkZKs030E+Wsc1eYXW3SKt4XeHxK71ZT3RVlLV4CjgFIuj9A/aIVw6
	JTjcCKCAZUiOH9ZguKWhvXrr2Qbou5avdwe9dszkvU9CirdfWOtxiwRrML3tvZ9a27DW
	XSEm/LKcBiD0CuOvcRrsSmLKqmNwRMc61mcMBlywzaR/RbacQdbOfnofk4FFQHeduLCL
	ZSxeWT9Nu4Ghr30f/HheHJvlxWiIt0g1k6CYbXCGquZ957Mnn8Ds6pFKVOU2CnXjeS8U
	iemEOalljiLRCPFHDCNKUE80l1Yj0FZFOHLUufRrMnfneL11Fc5d7palu/vinNy5qPs7
	oAaA==
X-Gm-Message-State: AOAM533JbjrvUNDUyRP6jaWeHNqFfzLflSaKjNeiE4XtO7Oe/aqpKKiG
	WxnIjx6VUCiw7DHJBfbDtrBzhA==
X-Google-Smtp-Source: ABdhPJz0uPVw4uTkRdrIO7TzhB2Lba173UNDrRCxhWTmJsoVc5B9xp6IVviROg24clsZ0WL2ywrxIQ==
X-Received: by 2002:a5d:4e8c:: with SMTP id e12mr3955329wru.94.1621512045562; 
	Thu, 20 May 2021 05:00:45 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
	by smtp.gmail.com with ESMTPSA id
	s199sm8848269wme.43.2021.05.20.05.00.44
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 May 2021 05:00:45 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Thu, 20 May 2021 13:00:28 +0100
Message-Id: <20210520120043.3462759-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
	cluster-devel@redhat.com, to <linux-ntfs-dev@lists.sourceforge>,
	Anton Altaparmakov <anton@tuxera.com>
Subject: [Cluster-devel] [PATCH 00/15] Rid W=1 warnings from FS {GFS2, NTFS}
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

This set is part of a larger effort attempting to clean-up W=1
kernel builds, which are currently overwhelmingly riddled with
niggly little warnings.

Lee Jones (15):
  fs: gfs2: bmap: Demote half-complete kernel-doc headers fix others
  fs: gfs2: glock: Fix some deficient kernel-doc headers and demote
    non-conformant ones
  fs: ntfs: namei: Demote non-conformant kernel-doc headers
  fs: ntfs: unistr: Add missing param descriptions for 'name{1,2}_len'
  fs: ntfs: compress: Demote a few non-conformant kernel-doc headers
  fs: ntfs: dir: Supply missing descriptions for 'start' and 'end' and
    demote other headers
  fs: ntfs: runlist: Demote non-conformant kernel-doc headers
  fs: ntfs: inode: Fix incorrect function name and demote file header
  fs: ntfs: attrib: File headers are not good candidates for kernel-doc
  fs: ntfs: aops: Demote kernel-doc abuses
  fs: ntfs: super: Provide missing description and demote non-conformant
    headers
  fs: ntfs: file: Provide missing descriptions for 'start' and 'end'
  fs: ntfs: mft: File headers to not make good candidates for kernel-doc
  fs: ntfs: compress: File headers are not good candidates for
    kernel-doc
  fs: ntfs: runlist: File headers are not good candidates for kernel-doc

 fs/gfs2/bmap.c     |  2 +-
 fs/gfs2/glock.c    |  4 ++--
 fs/ntfs/aops.c     |  8 ++++----
 fs/ntfs/attrib.c   |  2 +-
 fs/ntfs/compress.c | 12 ++++++------
 fs/ntfs/dir.c      |  7 ++++---
 fs/ntfs/file.c     |  2 ++
 fs/ntfs/inode.c    |  4 ++--
 fs/ntfs/mft.c      |  2 +-
 fs/ntfs/namei.c    |  4 ++--
 fs/ntfs/runlist.c  |  6 +++---
 fs/ntfs/super.c    |  5 +++--
 fs/ntfs/unistr.c   |  2 ++
 13 files changed, 33 insertions(+), 27 deletions(-)

Cc: Andreas Gruenbacher <agruenba@redhat.com>
Cc: Anton Altaparmakov <anton@tuxera.com>
Cc: Bob Peterson <rpeterso@redhat.com>
Cc: cluster-devel@redhat.com
Cc: linux-ntfs-dev@lists.sourceforge.net
Cc: to <linux-ntfs-dev@lists.sourceforge>
-- 
2.31.1

