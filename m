Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4D1C71AA9FD
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Apr 2020 16:33:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586961197;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OLQFWI6JzQq4F9oiOLBE+1KoMDi0vrsaqC2CQH0g5yI=;
	b=a+saddrPUWQ82eGQR27QLrSpyfLpcVBMbPsUG1rPycE7QLEmt+oqarqeZv9f+zYsqHQAG5
	RQqZ6JGe+KqWCvHli+z1eMxBugUamla2QBhHvbIri6zkungu1SuzCJjs+yWX7FT+8bbDjt
	MGvNR6OWcOGCKe6Z6caZwgOSJWA3U+k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-sKQex0U2MSyGhYDnrZkF4w-1; Wed, 15 Apr 2020 10:33:11 -0400
X-MC-Unique: sKQex0U2MSyGhYDnrZkF4w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D234802B7A;
	Wed, 15 Apr 2020 14:33:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 69E741265A0;
	Wed, 15 Apr 2020 14:33:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 934D418089CD;
	Wed, 15 Apr 2020 14:33:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03FEX0e1006302 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 Apr 2020 10:33:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 621962026D68; Wed, 15 Apr 2020 14:33:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E2FA2026D66
	for <cluster-devel@redhat.com>; Wed, 15 Apr 2020 14:32:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E3C58056A3
	for <cluster-devel@redhat.com>; Wed, 15 Apr 2020 14:32:57 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-383-GQ7gQJulNDulyinOfHpmtw-1;
	Wed, 15 Apr 2020 10:32:52 -0400
X-MC-Unique: GQ7gQJulNDulyinOfHpmtw-1
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de
	[95.90.212.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id AE72520857;
	Wed, 15 Apr 2020 14:32:50 +0000 (UTC)
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
	(envelope-from <mchehab@kernel.org>)
	id 1jOj5s-006kNi-SJ; Wed, 15 Apr 2020 16:32:48 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Date: Wed, 15 Apr 2020 16:32:13 +0200
Message-Id: <cover.1586960617.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03FEX0e1006302
X-loop: cluster-devel@redhat.com
Cc: codalist@telemann.coda.cs.cmu.edu, freedreno@lists.freedesktop.org,
	linux-usb@vger.kernel.org, linux-xfs@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-arm-msm@vger.kernel.org, ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-unionfs@vger.kernel.org, cluster-devel@redhat.com,
	linux-ntfs-dev@lists.sourceforge.net, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-afs@lists.infradead.org,
	ocfs2-devel@oss.oracle.com
Subject: [Cluster-devel] [PATCH 00/34] fs: convert remaining docs to ReST
	file format
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

This patch series convert the remaining files under Documentation/filesyste=
ms
to the ReST file format. It is based on linux-next (next-20200414).

PS.: I opted to add mainly ML from the output of get_maintainers.pl to the =
c/c
list of patch 00/34, because  otherwise the number of c/c would be too many=
,
with would very likely cause ML servers to reject it.

The results of those changes (together with other changes from my pending
doc patches) are available at:

   https://www.infradead.org/~mchehab/kernel_docs/filesystems/index.html

Mauro Carvalho Chehab (34):
  docs: filesystems: fix references for doc files there
  docs: filesystems: convert caching/object.txt to ReST
  docs: filesystems: convert caching/fscache.txt to ReST format
  docs: filesystems: caching/netfs-api.txt: convert it to ReST
  docs: filesystems: caching/operations.txt: convert it to ReST
  docs: filesystems: caching/cachefiles.txt: convert to ReST
  docs: filesystems: caching/backend-api.txt: convert it to ReST
  docs: filesystems: convert cifs/cifsroot.rst to ReST
  docs: filesystems: convert configfs.txt to ReST
  docs: filesystems: convert automount-support.txt to ReST
  docs: filesystems: convert coda.txt to ReST
  docs: filesystems: convert dax.txt to ReST
  docs: filesystems: convert devpts.txt to ReST
  docs: filesystems: convert dnotify.txt to ReST
  docs: filesystems: convert fiemap.txt to ReST
  docs: filesystems: convert files.txt to ReST
  docs: filesystems: convert fuse-io.txt to ReST
  docs: filesystems: convert gfs2-glocks.txt to ReST
  docs: filesystems: convert locks.txt to ReST
  docs: filesystems: convert mandatory-locking.txt to ReST
  docs: filesystems: convert mount_api.txt to ReST
  docs: filesystems: rename path-lookup.txt file
  docs: filesystems: convert path-walking.txt to ReST
  docs: filesystems: convert quota.txt to ReST
  docs: filesystems: convert seq_file.txt to ReST
  docs: filesystems: convert sharedsubtree.txt to ReST
  docs: filesystems: split spufs.txt into 3 separate files
  docs: filesystems: convert spufs/spu_create.txt to ReST
  docs: filesystems: convert spufs/spufs.txt to ReST
  docs: filesystems: convert spufs/spu_run.txt to ReST
  docs: filesystems: convert sysfs-pci.txt to ReST
  docs: filesystems: convert sysfs-tagging.txt to ReST
  docs: filesystems: convert xfs-delayed-logging-design.txt to ReST
  docs: filesystems: convert xfs-self-describing-metadata.txt to ReST

 Documentation/ABI/stable/sysfs-devices-node   |    2 +-
 Documentation/ABI/testing/procfs-smaps_rollup |    2 +-
 Documentation/admin-guide/cpu-load.rst        |    2 +-
 Documentation/admin-guide/ext4.rst            |    2 +-
 Documentation/admin-guide/nfs/nfsroot.rst     |    2 +-
 Documentation/admin-guide/sysctl/kernel.rst   |    2 +-
 .../driver-api/driver-model/device.rst        |    2 +-
 .../driver-api/driver-model/overview.rst      |    2 +-
 ...ount-support.txt =3D> automount-support.rst} |   23 +-
 .../{backend-api.txt =3D> backend-api.rst}      |  165 +-
 .../{cachefiles.txt =3D> cachefiles.rst}        |  139 +-
 Documentation/filesystems/caching/fscache.rst |  565 ++++++
 Documentation/filesystems/caching/fscache.txt |  448 -----
 Documentation/filesystems/caching/index.rst   |   14 +
 .../caching/{netfs-api.txt =3D> netfs-api.rst}  |  172 +-
 .../caching/{object.txt =3D> object.rst}        |   43 +-
 .../{operations.txt =3D> operations.rst}        |   45 +-
 .../cifs/{cifsroot.txt =3D> cifsroot.rst}       |   56 +-
 Documentation/filesystems/coda.rst            | 1670 ++++++++++++++++
 Documentation/filesystems/coda.txt            | 1676 -----------------
 .../{configfs/configfs.txt =3D> configfs.rst}   |  129 +-
 .../filesystems/{dax.txt =3D> dax.rst}          |   11 +-
 Documentation/filesystems/devpts.rst          |   36 +
 Documentation/filesystems/devpts.txt          |   26 -
 .../filesystems/{dnotify.txt =3D> dnotify.rst}  |   13 +-
 Documentation/filesystems/ext2.rst            |    2 +-
 .../filesystems/{fiemap.txt =3D> fiemap.rst}    |  133 +-
 .../filesystems/{files.txt =3D> files.rst}      |   15 +-
 .../filesystems/{fuse-io.txt =3D> fuse-io.rst}  |    6 +
 .../{gfs2-glocks.txt =3D> gfs2-glocks.rst}      |  147 +-
 Documentation/filesystems/index.rst           |   26 +
 .../filesystems/{locks.txt =3D> locks.rst}      |   14 +-
 ...tory-locking.txt =3D> mandatory-locking.rst} |   25 +-
 .../{mount_api.txt =3D> mount_api.rst}          |  329 ++--
 .../{path-lookup.txt =3D> path-walking.rst}     |   88 +-
 Documentation/filesystems/porting.rst         |    2 +-
 Documentation/filesystems/proc.rst            |    2 +-
 .../filesystems/{quota.txt =3D> quota.rst}      |   41 +-
 .../filesystems/ramfs-rootfs-initramfs.rst    |    2 +-
 .../{seq_file.txt =3D> seq_file.rst}            |   61 +-
 .../{sharedsubtree.txt =3D> sharedsubtree.rst}  |  394 ++--
 Documentation/filesystems/spufs/index.rst     |   13 +
 .../filesystems/spufs/spu_create.rst          |  131 ++
 Documentation/filesystems/spufs/spu_run.rst   |  138 ++
 .../{spufs.txt =3D> spufs/spufs.rst}            |  304 +--
 .../{sysfs-pci.txt =3D> sysfs-pci.rst}          |   23 +-
 .../{sysfs-tagging.txt =3D> sysfs-tagging.rst}  |   22 +-
 ...ign.txt =3D> xfs-delayed-logging-design.rst} |   65 +-
 ...a.txt =3D> xfs-self-describing-metadata.rst} |  182 +-
 Documentation/iio/iio_configfs.rst            |    2 +-
 .../powerpc/firmware-assisted-dump.rst        |    2 +-
 Documentation/process/adding-syscalls.rst     |    2 +-
 .../it_IT/process/adding-syscalls.rst         |    2 +-
 .../translations/zh_CN/filesystems/sysfs.txt  |    6 +-
 Documentation/usb/gadget_configfs.rst         |    4 +-
 MAINTAINERS                                   |   16 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |    2 +-
 fs/Kconfig                                    |    2 +-
 fs/Kconfig.binfmt                             |    2 +-
 fs/adfs/Kconfig                               |    2 +-
 fs/affs/Kconfig                               |    2 +-
 fs/afs/Kconfig                                |    6 +-
 fs/bfs/Kconfig                                |    2 +-
 fs/cachefiles/Kconfig                         |    4 +-
 fs/coda/Kconfig                               |    2 +-
 fs/configfs/inode.c                           |    2 +-
 fs/configfs/item.c                            |    2 +-
 fs/cramfs/Kconfig                             |    2 +-
 fs/dcache.c                                   |    6 +-
 fs/ecryptfs/Kconfig                           |    2 +-
 fs/fat/Kconfig                                |    8 +-
 fs/fscache/Kconfig                            |    8 +-
 fs/fscache/cache.c                            |    8 +-
 fs/fscache/cookie.c                           |    2 +-
 fs/fscache/object.c                           |    4 +-
 fs/fscache/operation.c                        |    2 +-
 fs/fuse/Kconfig                               |    2 +-
 fs/fuse/dev.c                                 |    2 +-
 fs/hfs/Kconfig                                |    2 +-
 fs/hpfs/Kconfig                               |    2 +-
 fs/isofs/Kconfig                              |    2 +-
 fs/locks.c                                    |    2 +-
 fs/namei.c                                    |    2 +-
 fs/namespace.c                                |    2 +-
 fs/notify/inotify/Kconfig                     |    2 +-
 fs/ntfs/Kconfig                               |    2 +-
 fs/ocfs2/Kconfig                              |    2 +-
 fs/overlayfs/Kconfig                          |    6 +-
 fs/proc/Kconfig                               |    4 +-
 fs/romfs/Kconfig                              |    2 +-
 fs/sysfs/dir.c                                |    2 +-
 fs/sysfs/file.c                               |    2 +-
 fs/sysfs/mount.c                              |    2 +-
 fs/sysfs/symlink.c                            |    2 +-
 fs/sysv/Kconfig                               |    2 +-
 fs/udf/Kconfig                                |    2 +-
 include/linux/configfs.h                      |    2 +-
 include/linux/fs_context.h                    |    2 +-
 include/linux/fscache-cache.h                 |    4 +-
 include/linux/fscache.h                       |   42 +-
 include/linux/lsm_hooks.h                     |    2 +-
 include/linux/relay.h                         |    2 +-
 include/linux/sysfs.h                         |    2 +-
 kernel/relay.c                                |    2 +-
 104 files changed, 4048 insertions(+), 3572 deletions(-)
 rename Documentation/filesystems/{automount-support.txt =3D> automount-sup=
port.rst} (92%)
 rename Documentation/filesystems/caching/{backend-api.txt =3D> backend-api=
.rst} (87%)
 rename Documentation/filesystems/caching/{cachefiles.txt =3D> cachefiles.r=
st} (90%)
 create mode 100644 Documentation/filesystems/caching/fscache.rst
 delete mode 100644 Documentation/filesystems/caching/fscache.txt
 create mode 100644 Documentation/filesystems/caching/index.rst
 rename Documentation/filesystems/caching/{netfs-api.txt =3D> netfs-api.rst=
} (91%)
 rename Documentation/filesystems/caching/{object.txt =3D> object.rst} (95%=
)
 rename Documentation/filesystems/caching/{operations.txt =3D> operations.r=
st} (90%)
 rename Documentation/filesystems/cifs/{cifsroot.txt =3D> cifsroot.rst} (72=
%)
 create mode 100644 Documentation/filesystems/coda.rst
 delete mode 100644 Documentation/filesystems/coda.txt
 rename Documentation/filesystems/{configfs/configfs.txt =3D> configfs.rst}=
 (87%)
 rename Documentation/filesystems/{dax.txt =3D> dax.rst} (96%)
 create mode 100644 Documentation/filesystems/devpts.rst
 delete mode 100644 Documentation/filesystems/devpts.txt
 rename Documentation/filesystems/{dnotify.txt =3D> dnotify.rst} (88%)
 rename Documentation/filesystems/{fiemap.txt =3D> fiemap.rst} (70%)
 rename Documentation/filesystems/{files.txt =3D> files.rst} (95%)
 rename Documentation/filesystems/{fuse-io.txt =3D> fuse-io.rst} (95%)
 rename Documentation/filesystems/{gfs2-glocks.txt =3D> gfs2-glocks.rst} (6=
3%)
 rename Documentation/filesystems/{locks.txt =3D> locks.rst} (91%)
 rename Documentation/filesystems/{mandatory-locking.txt =3D> mandatory-loc=
king.rst} (91%)
 rename Documentation/filesystems/{mount_api.txt =3D> mount_api.rst} (79%)
 rename Documentation/filesystems/{path-lookup.txt =3D> path-walking.rst} (=
91%)
 rename Documentation/filesystems/{quota.txt =3D> quota.rst} (81%)
 rename Documentation/filesystems/{seq_file.txt =3D> seq_file.rst} (92%)
 rename Documentation/filesystems/{sharedsubtree.txt =3D> sharedsubtree.rst=
} (72%)
 create mode 100644 Documentation/filesystems/spufs/index.rst
 create mode 100644 Documentation/filesystems/spufs/spu_create.rst
 create mode 100644 Documentation/filesystems/spufs/spu_run.rst
 rename Documentation/filesystems/{spufs.txt =3D> spufs/spufs.rst} (57%)
 rename Documentation/filesystems/{sysfs-pci.txt =3D> sysfs-pci.rst} (92%)
 rename Documentation/filesystems/{sysfs-tagging.txt =3D> sysfs-tagging.rst=
} (72%)
 rename Documentation/filesystems/{xfs-delayed-logging-design.txt =3D> xfs-=
delayed-logging-design.rst} (97%)
 rename Documentation/filesystems/{xfs-self-describing-metadata.txt =3D> xf=
s-self-describing-metadata.rst} (83%)

--=20
2.25.2



