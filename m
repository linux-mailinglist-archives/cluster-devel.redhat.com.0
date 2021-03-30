Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6E0D434EE3E
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Mar 2021 18:47:30 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-XfmJFmqPN8G--2whTdYJqw-1; Tue, 30 Mar 2021 12:47:27 -0400
X-MC-Unique: XfmJFmqPN8G--2whTdYJqw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3FC9180FCAB;
	Tue, 30 Mar 2021 16:47:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E1A885D730;
	Tue, 30 Mar 2021 16:47:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C56A44BB7C;
	Tue, 30 Mar 2021 16:47:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12UGj9DO010745 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Mar 2021 12:45:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4EA232157F29; Tue, 30 Mar 2021 16:45:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 488C42157F25
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 16:45:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8DAF410334A3
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 16:45:07 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-307-KXHlP1MVP6edLXZFoRwxag-1; Tue, 30 Mar 2021 12:45:02 -0400
X-MC-Unique: KXHlP1MVP6edLXZFoRwxag-1
Received: by mail-wr1-f46.google.com with SMTP id b9so16861089wrt.8
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 09:45:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wj7QJj3J1iXDZqjFd2EjWvYDk/YLZB6mDqda5uCd8PA=;
	b=DpVSZIdygpjeQ3xFcrAelHy+CE9BdugWku5DGJxczG3RePYbvcVlBibgLMD6V/LDXK
	IWnLoHZ22tM6lFum65rMDAuSJwrlmtHxMpyhnD84ok0wnF3C5UIR6T6kZL2++Xmyzixd
	CQlWAdnlGfDMukgBZFCLJ3Kq2epVlLclOMPStURGcW3SCbkAjk5M0aaY4pcA7LdKU5kV
	AO6uOKFjTymjGKbl64FcwES8Fz9oERfcteecWaC2N4X4LquiwJH/d1lfcye2XVUza0Ok
	naDXmwP82w7dJtCDYvtkCdUBinC8jNorUGJUHiBRW+o991pKKqryqrRGSSG4vAgw8jAW
	Omng==
X-Gm-Message-State: AOAM531H373kHE62YYg2/sXQmjfy/faV48GznlyNLv22Bm411674efd4
	/XMBt/v27/oSoxyjffTIpDJ14g==
X-Google-Smtp-Source: ABdhPJw8bSgOwdXD8SiSGcskMEroP9a/+g+c6gm5CplNsn6AiBePVMzP4YHscQ1ycolGdTZ/nJ1MXA==
X-Received: by 2002:a05:6000:1789:: with SMTP id
	e9mr35389492wrg.237.1617122701533; 
	Tue, 30 Mar 2021 09:45:01 -0700 (PDT)
Received: from dell.default ([91.110.221.217])
	by smtp.gmail.com with ESMTPSA id
	a15sm25660805wrr.53.2021.03.30.09.45.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 30 Mar 2021 09:45:00 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Tue, 30 Mar 2021 17:44:27 +0100
Message-Id: <20210330164458.1625478-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: David Howells <dhowells@redhat.com>, Michal Hocko <mhocko@suse.com>,
	Eric Biggers <ebiggers@google.com>, ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, James Morris <jamorris@linux.microsoft.com>,
	Tycho Andersen <tycho@tycho.pizza>, cluster-devel@redhat.com,
	"Michael A. Halcrow" <mahalcro@us.ibm.com>,
	"Trevor S. Highland" <trevor.highland@gmail.com>,
	Waiman Long <longman@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>,
	Tyler Hicks <code@tyhicks.com>, Andrew Morton <akpm@linux-foundation.org>,
	"Michael C. Thompsion" <mcthomps@us.ibm.com>,
	Christian Brauner <christian.brauner@ubuntu.com>,
	"Michael A. Halcrow" <mhalcrow@us.ibm.com>
Subject: [Cluster-devel] [PATCH 00/31] Rid W=1 warnings from GFS2 and
	EncryptFS
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

This set is part of a larger effort attempting to clean-up W=1
kernel builds, which are currently overwhelmingly riddled with
niggly little warnings.

There is more to do in filesystems.  Another set will follow.

Lee Jones (31):
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
  fs: gfs2: file: Strip out superfluous param description and demote
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
  fs: ecryptfs: read_write: File headers do not make good candidates for
    kernel-doc
  fs: ecryptfs: debug: Demote a couple of kernel-doc abuses
  fs: ecryptfs: dentry: File headers are not good candidates for
    kernel-doc
  fs: ecryptfs: kthread: Demote file header and provide description for
    'cred'
  fs: ecryptfs: file: Demote kernel-doc abuses
  fs: ecryptfs: super: Fix formatting, naming and kernel-doc abuses
  fs: ecryptfs: messaging: Add missing param descriptions and demote
    abuses
  fs: ecryptfs: main: Demote a bunch of non-conformant kernel-doc
    headers
  fs: ecryptfs: miscdev: File headers are not good kernel-doc candidates
  fs: ecryptfs: crypto: Supply some missing param descriptions and
    demote abuses
  fs: ecryptfs: mmap: Help out one function header and demote other
    abuses
  fs: ecryptfs: inode: Help out nearly-there header and demote
    non-conformant ones
  fs: ecryptfs: keystore: Fix some kernel-doc issues and demote
    non-conformant headers

 fs/ecryptfs/crypto.c     | 20 ++++++++++----------
 fs/ecryptfs/debug.c      |  4 ++--
 fs/ecryptfs/dentry.c     |  2 +-
 fs/ecryptfs/file.c       |  4 ++--
 fs/ecryptfs/inode.c      | 11 +++++------
 fs/ecryptfs/keystore.c   | 13 +++++++------
 fs/ecryptfs/kthread.c    |  3 ++-
 fs/ecryptfs/main.c       | 20 +++++++++-----------
 fs/ecryptfs/messaging.c  |  8 +++++---
 fs/ecryptfs/miscdev.c    |  3 ++-
 fs/ecryptfs/mmap.c       | 11 ++++++-----
 fs/ecryptfs/read_write.c |  4 +++-
 fs/ecryptfs/super.c      |  8 ++++----
 fs/gfs2/aops.c           |  5 +----
 fs/gfs2/bmap.c           |  4 ++--
 fs/gfs2/dir.c            | 35 +++++++++++++----------------------
 fs/gfs2/file.c           |  3 +--
 fs/gfs2/glock.c          |  9 ++++-----
 fs/gfs2/glops.c          | 18 ++++++------------
 fs/gfs2/inode.c          | 22 ++++++++++++----------
 fs/gfs2/lock_dlm.c       |  3 +--
 fs/gfs2/log.c            | 11 ++++-------
 fs/gfs2/lops.c           | 13 +++++++------
 fs/gfs2/meta_io.c        |  1 +
 fs/gfs2/ops_fstype.c     |  7 ++-----
 fs/gfs2/quota.c          |  2 +-
 fs/gfs2/recovery.c       |  3 ++-
 fs/gfs2/rgrp.c           |  4 +++-
 fs/gfs2/super.c          | 13 ++++++-------
 fs/gfs2/util.c           | 19 ++++++++++---------
 fs/gfs2/xattr.c          | 25 +++++++------------------
 31 files changed, 141 insertions(+), 167 deletions(-)

Cc: Andreas Gruenbacher <agruenba@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Bob Peterson <rpeterso@redhat.com>
Cc: Christian Brauner <christian.brauner@ubuntu.com>
Cc: cluster-devel@redhat.com
Cc: David Howells <dhowells@redhat.com>
Cc: ecryptfs@vger.kernel.org
Cc: Eric Biggers <ebiggers@google.com>
Cc: James Morris <jamorris@linux.microsoft.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: "Michael A. Halcrow" <mahalcro@us.ibm.com>
Cc: "Michael A. Halcrow" <mhalcrow@us.ibm.com>
Cc: "Michael C. Thompsion" <mcthomps@us.ibm.com>
Cc: "Michael C. Thompson" <mcthomps@us.ibm.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: "Trevor S. Highland" <trevor.highland@gmail.com>
Cc: Tycho Andersen <tycho@tycho.pizza>
Cc: Tyler Hicks <code@tyhicks.com>
Cc: Waiman Long <longman@redhat.com>
-- 
2.27.0

