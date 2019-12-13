Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id A2E6A11EC15
	for <lists+cluster-devel@lfdr.de>; Fri, 13 Dec 2019 21:51:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576270289;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wBF+p7oNT7Dz4QRmajaQyFnkCLUJJxqLX/PvjSj+OlU=;
	b=CJ31bv+LK7lI11VErsUZBOnJJnorFN2r6OCVOgVHMK4ZIpJidWgkljbn630W5IF0fUF6GR
	Do/hO2iLxD4gA+G8klhNCURNedCdnI6+NY5V/kpkpLW9SAfIPeUHTcKApTsvSyMqokMwUh
	iyPS+tJWb4YWaDTxhjjudzP+FUmThNw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-R3VBbi9ePrewyueXdQi-2A-1; Fri, 13 Dec 2019 15:51:27 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CEF05DB21;
	Fri, 13 Dec 2019 20:51:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 16DF710013A7;
	Fri, 13 Dec 2019 20:51:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2993D18089C8;
	Fri, 13 Dec 2019 20:51:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBDKp2WA022833 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 13 Dec 2019 15:51:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F208B2166B2A; Fri, 13 Dec 2019 20:51:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED8872166B27
	for <cluster-devel@redhat.com>; Fri, 13 Dec 2019 20:50:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96FB4801E8F
	for <cluster-devel@redhat.com>; Fri, 13 Dec 2019 20:50:59 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-384-z5FFXfMnM8yU4FZ-md0o-A-1; Fri, 13 Dec 2019 15:50:56 -0500
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
	(mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
	1MvbO4-1hpQC52QtS-00scVY; Fri, 13 Dec 2019 21:50:19 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: y2038@lists.linaro.org, linux-kernel@vger.kernel.org
Date: Fri, 13 Dec 2019 21:49:09 +0100
Message-Id: <20191213204936.3643476-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:uP+kiANpOGJCAXUng4IDyXrHx7+oq5wNuUSCR2Raiw5aTIDdJGg
	5j4AA9RZwtRFpSlQJZR8HotU54Xfp+erI4gckXGaucpRhzYx4dcdDnO9RE7chr7C+S6QsS1
	hz8jSvfht0kOIuwI+U39is0hUz6MZ6pZnETpaFRYUgmMegCz9cluYoQw5GzMKND6Vlt+MoP
	vuRLets3Xp1M/VHl6bYkg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kP6IKflIR3w=:FkB32fEkAgwus2sZyvbWHj
	gR1XadNmIQfTKvjDx+NHX537KVRwu9adI8C1WG7Uvu2xqdyhi6NbGnzLLS3erKQVoi1q2bcZJ
	fRUG1d36ibEvFjwqysbPbwC5u4DHiftBkUdZ02IxQaCgRmMake1padTMioHJ5VK44dQCw0Wgi
	l9FfLjhcz0ZpYw+KmnFwnCxdaEQ4rrmqMmI9qQZLKGibtvLox0uwJBt2f1iziiy+EV55optWx
	eHVAl6FcsIhDR1hGIagPTt0pygd3l5tg/E0N5N3r8mcI/qaniqvi6KMSXngpuISEjztZUFIKj
	E4vl7qLyA/xxvBi57YzPutpomt5K21wonhWSM7aFqvVNnIjTmvlIhulMkCwyDac28R/Z4Dp0g
	KMewi00ymEE1euw319FGcrDlXrYDszeK+FvG14u8GD9wvnlwoLF7R9G2nx97kdApqLxfkXQly
	B+hANhQzcIaPqD3Mj4IbgJQGI17ypNCagD8+FwqTZDb0OBqInzQnwij7FBHUOWFHF3Qs/EI7o
	1nrINilaeyXksJoTUhiuzSirhvGWBkbMzW5k02tP0uTz7sxrCz/FxXHDE522PcCDuQTBlyv+I
	QJ9z1iVT5Xg/jxkC7PWxkiiqjSgCEiTCIb6V84/lzwlgwaR4VDO+WH8ZX/gzqVNe9o9vQ3KSE
	8vilfRFPAZi1Or+AvWmTgxeRFkLvobJdMhGGlGJUFAh0XHUkVTF0t8WkeZWhW85ocAbJ5g94z
	t07OthlwQEZNuwc5Z06FKMmP8bFmSpWpMf3TMpq6QCKO+gB6xZa0zdZgyTvgHlhAZckFpPNzt
	SLryaKF3jS+MB5IeJX7dR8/nMWgS5LTwsezZchNIkyBiQLIxvP9ZVqFsGf6QbesMAbCjQWssu
	Ok7QMsSa208ewWk2bxEw==
X-MC-Unique: z5FFXfMnM8yU4FZ-md0o-A-1
X-MC-Unique: R3VBbi9ePrewyueXdQi-2A-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xBDKp2WA022833
X-loop: cluster-devel@redhat.com
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, jcmvbkbc@gmail.com,
	netdev@vger.kernel.org, sparclinux@vger.kernel.org,
	linux1394-devel@lists.sourceforge.net,
	devel@driverdev.osuosl.org, darrick.wong@oracle.com,
	richard@nod.at, cluster-devel@redhat.com,
	linux+etnaviv@armlinux.org.uk, Arnd Bergmann <arnd@arndb.de>,
	linux-arm-msm@vger.kernel.org, jdike@addtoit.com,
	linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org,
	christian.gmeiner@gmail.com, viro@zeniv.linux.org.uk,
	tglx@linutronix.de, sean@poorly.run,
	trond.myklebust@hammerspace.com, hirofumi@mail.parknet.co.jp,
	linux-nfs@vger.kernel.org, valdis.kletnieks@vt.edu,
	rfontana@redhat.com, gregkh@linuxfoundation.org, fw@strlen.de,
	anna.schumaker@netapp.com, linux-xfs@vger.kernel.org,
	robdclark@gmail.com, stefanr@s5r6.in-berlin.de, daniel@ffwll.ch,
	jack@suse.com, linux-fsdevel@vger.kernel.org,
	freedreno@lists.freedesktop.org, davem@davemloft.net,
	l.stach@pengutronix.de
Subject: [Cluster-devel] [PATCH v2 00/24] drivers, fs: y2038 updates
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

These are updates to devidce drivers and file systems that for some
reason or another were not included in the kernel in the previous
y2038 series.

I've gone through all users of time_t again to make sure the
kernel is in a long-term maintainable state.

Posting these as a series for better organization, but each change
here is applicable standalone.

Please merge, review, ack/nack etc as you see fit. I will
add these to my y2038 branch [1] for linux-next, but can keep
rebasing for feedback and to remove any patches that get
picked up by a maintainer.

Changes since v1 [2]:

- Add Acks I received
- Rebase to v5.5-rc1, droping patches that got merged already
- Add NFS, XFS and the final three patches from another series
- Rewrite etnaviv patches

      Arnd

[1] https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/log=
/?h=3Dy2038
[2] https://lore.kernel.org/lkml/20191108213257.3097633-1-arnd@arndb.de/

Arnd Bergmann (24):
  Input: input_event: fix struct padding on sparc64
  fat: use prandom_u32() for i_generation
  dlm: use SO_SNDTIMEO_NEW instead of SO_SNDTIMEO_OLD
  xtensa: ISS: avoid struct timeval
  um: ubd: use 64-bit time_t where possible
  acct: stop using get_seconds()
  tsacct: add 64-bit btime field
  packet: clarify timestamp overflow
  quota: avoid time_t in v1_disk_dqblk definition
  hostfs: pass 64-bit timestamps to/from user space
  hfs/hfsplus: use 64-bit inode timestamps
  drm/msm: avoid using 'timespec'
  drm/etnaviv: reject timeouts with tv_nsec >=3D NSEC_PER_SEC
  drm/etnaviv: avoid deprecated timespec
  sunrpc: convert to time64_t for expiry
  nfs: use time64_t internally
  nfs: fix timstamp debug prints
  nfs: fscache: use timespec64 in inode auxdata
  xfs: rename compat_time_t to old_time32_t
  xfs: disallow broken ioctls without compat-32-bit-time
  xfs: quota: move to time64_t interfaces
  y2038: remove obsolete jiffies conversion functions
  y2038: rename itimerval to __kernel_old_itimerval
  y2038: sparc: remove use of struct timex

 arch/sparc/kernel/sys_sparc_64.c              | 29 +++++-----
 arch/um/drivers/cow.h                         |  2 +-
 arch/um/drivers/cow_user.c                    |  7 ++-
 arch/um/drivers/ubd_kern.c                    | 10 ++--
 arch/um/include/shared/os.h                   |  2 +-
 arch/um/os-Linux/file.c                       |  2 +-
 .../platforms/iss/include/platform/simcall.h  |  4 +-
 drivers/gpu/drm/etnaviv/etnaviv_drv.c         | 20 ++++---
 drivers/gpu/drm/etnaviv/etnaviv_drv.h         | 11 ++--
 drivers/gpu/drm/etnaviv/etnaviv_gem.c         |  4 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.h         |  2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c         |  5 +-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h         |  5 +-
 drivers/gpu/drm/msm/msm_drv.h                 |  3 +-
 drivers/input/evdev.c                         | 14 ++---
 drivers/input/misc/uinput.c                   | 14 +++--
 fs/dlm/lowcomms.c                             |  6 +-
 fs/fat/inode.c                                |  3 +-
 fs/hfs/hfs_fs.h                               | 28 +++++++--
 fs/hfs/inode.c                                |  4 +-
 fs/hfsplus/hfsplus_fs.h                       | 28 +++++++--
 fs/hfsplus/inode.c                            | 12 ++--
 fs/hostfs/hostfs.h                            | 22 ++++---
 fs/hostfs/hostfs_kern.c                       | 15 +++--
 fs/nfs/fscache-index.c                        |  6 +-
 fs/nfs/fscache.c                              | 18 ++++--
 fs/nfs/fscache.h                              |  8 ++-
 fs/nfs/nfs4xdr.c                              | 10 ++--
 fs/quota/quotaio_v1.h                         |  6 +-
 fs/xfs/xfs_dquot.c                            |  6 +-
 fs/xfs/xfs_ioctl.c                            | 26 +++++++++
 fs/xfs/xfs_ioctl32.c                          |  2 +-
 fs/xfs/xfs_ioctl32.h                          |  2 +-
 fs/xfs/xfs_qm.h                               |  6 +-
 fs/xfs/xfs_quotaops.c                         |  6 +-
 fs/xfs/xfs_trans_dquot.c                      |  8 ++-
 include/linux/jiffies.h                       | 20 -------
 include/linux/sunrpc/cache.h                  | 42 ++++++++------
 include/linux/sunrpc/gss_api.h                |  4 +-
 include/linux/sunrpc/gss_krb5.h               |  2 +-
 include/linux/syscalls.h                      |  9 ++-
 include/uapi/linux/acct.h                     |  2 +
 include/uapi/linux/input.h                    |  1 +
 include/uapi/linux/taskstats.h                |  6 +-
 include/uapi/linux/time_types.h               |  5 ++
 include/uapi/linux/timex.h                    |  2 +
 kernel/acct.c                                 |  4 +-
 kernel/time/itimer.c                          | 18 +++---
 kernel/time/time.c                            | 58 ++-----------------
 kernel/tsacct.c                               |  9 ++-
 net/packet/af_packet.c                        | 27 +++++----
 net/sunrpc/auth_gss/gss_krb5_mech.c           | 12 +++-
 net/sunrpc/auth_gss/gss_krb5_seal.c           |  8 +--
 net/sunrpc/auth_gss/gss_krb5_unseal.c         |  6 +-
 net/sunrpc/auth_gss/gss_krb5_wrap.c           | 16 ++---
 net/sunrpc/auth_gss/gss_mech_switch.c         |  2 +-
 net/sunrpc/auth_gss/svcauth_gss.c             |  6 +-
 net/sunrpc/cache.c                            | 16 ++---
 net/sunrpc/svcauth_unix.c                     | 10 ++--
 59 files changed, 351 insertions(+), 290 deletions(-)

--=20
2.20.0

Cc: jdike@addtoit.com
Cc: richard@nod.at
Cc: jcmvbkbc@gmail.com
Cc: stefanr@s5r6.in-berlin.de
Cc: l.stach@pengutronix.de
Cc: linux+etnaviv@armlinux.org.uk
Cc: christian.gmeiner@gmail.com
Cc: airlied@linux.ie
Cc: daniel@ffwll.ch
Cc: robdclark@gmail.com
Cc: sean@poorly.run
Cc: valdis.kletnieks@vt.edu
Cc: gregkh@linuxfoundation.org
Cc: ccaulfie@redhat.com
Cc: teigland@redhat.com
Cc: hirofumi@mail.parknet.co.jp
Cc: jack@suse.com
Cc: davem@davemloft.net
Cc: fw@strlen.de
Cc: viro@zeniv.linux.org.uk
Cc: rfontana@redhat.com
Cc: tglx@linutronix.de
Cc: linux-um@lists.infradead.org
Cc: linux1394-devel@lists.sourceforge.net
Cc: etnaviv@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: devel@driverdev.osuosl.org
Cc: cluster-devel@redhat.com
Cc: linux-fsdevel@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: trond.myklebust@hammerspace.com
Cc: anna.schumaker@netapp.com
Cc: linux-nfs@vger.kernel.org
Cc: linux-xfs@vger.kernel.org
Cc: darrick.wong@oracle.com
Cc: sparclinux@vger.kernel.org


