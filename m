Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 67E8CF59FE
	for <lists+cluster-devel@lfdr.de>; Fri,  8 Nov 2019 22:35:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573248918;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=c0gnbsbc8TjbLV1u5byD9QjNiqBK26X81E6+7Mb0JkU=;
	b=DyAbzfCNss8gNgElr1PUuMYrjkpOq3RHj/V0rumNMC5eInIABVOkTukQfVPgbaHFat7o9B
	+R8h6eNfhlB8+2I3c2SfrEwN1idOnmpA3pzePuaEY+C+buuTM2K5DwOlhlm2SshmgMSFUC
	5b5axjRWZORO3Z0yD8B4wCZjX/EkZwk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-7oLuuqbmOPaijNduFIP3DA-1; Fri, 08 Nov 2019 16:35:16 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85C46477;
	Fri,  8 Nov 2019 21:35:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 72D8E5C298;
	Fri,  8 Nov 2019 21:35:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 56E564BB65;
	Fri,  8 Nov 2019 21:35:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA8LZAUI006442 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 8 Nov 2019 16:35:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EBAB3451D; Fri,  8 Nov 2019 21:35:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx28.extmail.prod.ext.phx2.redhat.com
	[10.5.110.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 51B263CCA;
	Fri,  8 Nov 2019 21:35:08 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BCEEA8530C5;
	Fri,  8 Nov 2019 21:34:52 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
	(mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
	1MXXdn-1iQ6AP0R4R-00YveV; Fri, 08 Nov 2019 22:33:06 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: y2038@lists.linaro.org
Date: Fri,  8 Nov 2019 22:32:38 +0100
Message-Id: <20191108213257.3097633-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:cC60oL5qW9T6f3VnEX4IUPUnbZtH58Z5jHTCkfEP3lSVCyJMvvf
	nXa+3lb+MuvX4UyJFUN+jNUJOtYV6vEdBeRluSdOxKcMLTIRW/MA2X5WNg5vjL4h5VMaMqq
	bNkxydHkOOB1gWSeiigewsSsL+Ope/gjBqLstKOktXFNHvIvAI8OyB16Bh3/KHWq5bI5gbP
	ttyknhIOC7MVt+zSJY39Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:C6N/AXULkaM=:Y7JwaiMRl7Ar2O9O2mXFFn
	XNkpKgwWM8P0qO+0Is3DdFORJejcsg4Z7H/JEbKB71PaPIxwYqUaCL54KvYWbGI4UgpeJv2VL
	TDM5JP6XHLZEPg418lMXvJDgfjoG3Hi8z6xcm4eVCYMVOopNmDKLw8sRTvZs5Y9MehLPeuCjA
	FJDznxm+bmmpVwkpxdVxGg/UsFc/GByVXrqgr8aIeNTyU+6QiRoIugryzBDmS8vQIcTfTmtwM
	Xis+iVVThIPm/7TlELGn4QUpWrGuBM87bpEytZmN7iZ2Xv4Pi09GCc0fWAfdVlykCBom4fWhN
	SzMqNyByMJJu1qqSoOmRZIb/A06TGj1hHe1DR8fSuMXOJgyyZG4W2LkZTNTrG0kWBaTiNY4qD
	FOQ5PN5Ds9rUxxJ5jvFQEnBCHs0boCj+R1ogKQHj961SNOjz/iTK9PRAJ2Q/S9lr1OiO0Aill
	9n9w+FUDSA0uaCjboLcZG7ZPwbRrutTP1fW0uPjb2lcWPcBIloby7q+PHrtvR5VMW5jiv1fmf
	hfT7ITXtJL4SPQ1ZG94BaqALxufFNPlW7b2L8+b77UeY7PzZf7Q27rY8HVKNoecjq4sWzCpXp
	sCo16dBMR11yeGV02rWBECYG21JJTtOeHNbls/EWzI9gHEegxzRctljs0BXpmtr3fDrj8dL0R
	TjY2ibzd1SUcPAPXUGKnTI3EjBlBn5NTJbwUJGVyl+zhLeAtQdCVVn9ZET82XUaihtFVsb6l/
	VlZeLSfRYEOZKFWPEnJYv06Nf3Nrd84B+GWSJ7z9QIE1YkNSFvSz0y/FFznyuSImBN+NzxHxs
	7v0SH2wqAYB54MS6c3rahz8Oz2PuxEdQKh0LU5tG8fz8w3hUaZHnsrADS9CMXvPoTccssMd61
	Ly+JSeRt68rTP+cnNhXA==
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.69]); Fri, 08 Nov 2019 21:34:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.69]);
	Fri, 08 Nov 2019 21:34:53 +0000 (UTC) for IP:'212.227.126.130'
	DOMAIN:'mout.kundenserver.de' HELO:'mout.kundenserver.de'
	FROM:'arnd@arndb.de' RCPT:''
X-RedHat-Spam-Score: 0.001  (RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_NONE) 212.227.126.130 mout.kundenserver.de 212.227.126.130
	mout.kundenserver.de <arnd@arndb.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.69
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, jcmvbkbc@gmail.com,
	edumazet@google.com, netdev@vger.kernel.org,
	linux1394-devel@lists.sourceforge.net,
	devel@driverdev.osuosl.org, richard@nod.at, kadlec@netfilter.org,
	cluster-devel@redhat.com, coreteam@netfilter.org,
	linux+etnaviv@armlinux.org.uk, pablo@netfilter.org,
	Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
	jdike@addtoit.com, linux-um@lists.infradead.org,
	etnaviv@lists.freedesktop.org, christian.gmeiner@gmail.com,
	viro@zeniv.linux.org.uk, tglx@linutronix.de, sean@poorly.run,
	hirofumi@mail.parknet.co.jp, willemb@google.com,
	valdis.kletnieks@vt.edu, rfontana@redhat.com,
	gregkh@linuxfoundation.org, fw@strlen.de,
	linux-kernel@vger.kernel.org, robdclark@gmail.com,
	stefanr@s5r6.in-berlin.de, netfilter-devel@vger.kernel.org,
	daniel@ffwll.ch, jack@suse.com, linux-fsdevel@vger.kernel.org,
	freedreno@lists.freedesktop.org, davem@davemloft.net,
	l.stach@pengutronix.de
Subject: [Cluster-devel] [PATCH 00/16] drivers: y2038 updates
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
X-MC-Unique: 7oLuuqbmOPaijNduFIP3DA-1
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

Please merge, review, ack/nack etc as you see fit. My plan is to
include any patches that don't get a reply this time around in
a future pull request, probably for linux-5.6.

As mentioned before, the full series of 90 patches is available at
https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/log/?h=
=3Dy2038-endgame

    Arnd

Arnd Bergmann (16):
  staging: exfat: use prandom_u32() for i_generation
  fat: use prandom_u32() for i_generation
  net: sock: use __kernel_old_timespec instead of timespec
  dlm: use SO_SNDTIMEO_NEW instead of SO_SNDTIMEO_OLD
  xtensa: ISS: avoid struct timeval
  um: ubd: use 64-bit time_t where possible
  acct: stop using get_seconds()
  tsacct: add 64-bit btime field
  netfilter: nft_meta: use 64-bit time arithmetic
  packet: clarify timestamp overflow
  quota: avoid time_t in v1_disk_dqblk definition
  hostfs: pass 64-bit timestamps to/from user space
  hfs/hfsplus: use 64-bit inode timestamps
  drm/msm: avoid using 'timespec'
  drm/etnaviv: use ktime_t for timeouts
  firewire: ohci: stop using get_seconds() for BUS_TIME

 arch/um/drivers/cow.h                         |  2 +-
 arch/um/drivers/cow_user.c                    |  7 +++--
 arch/um/drivers/ubd_kern.c                    | 10 +++----
 arch/um/include/shared/os.h                   |  2 +-
 arch/um/os-Linux/file.c                       |  2 +-
 .../platforms/iss/include/platform/simcall.h  |  4 +--
 drivers/firewire/ohci.c                       |  2 +-
 drivers/gpu/drm/etnaviv/etnaviv_drv.c         | 19 ++++++-------
 drivers/gpu/drm/etnaviv/etnaviv_drv.h         | 21 ++++++--------
 drivers/gpu/drm/etnaviv/etnaviv_gem.c         |  5 ++--
 drivers/gpu/drm/etnaviv/etnaviv_gem.h         |  2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c         |  4 +--
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h         |  4 +--
 drivers/gpu/drm/msm/msm_drv.h                 |  3 +-
 drivers/staging/exfat/exfat_super.c           |  4 +--
 fs/dlm/lowcomms.c                             |  6 ++--
 fs/fat/inode.c                                |  3 +-
 fs/hfs/hfs_fs.h                               | 26 +++++++++++++----
 fs/hfs/inode.c                                |  4 +--
 fs/hfsplus/hfsplus_fs.h                       | 26 +++++++++++++----
 fs/hfsplus/inode.c                            | 12 ++++----
 fs/hostfs/hostfs.h                            | 22 +++++++++------
 fs/hostfs/hostfs_kern.c                       | 15 ++++++----
 fs/quota/quotaio_v1.h                         |  6 ++--
 include/linux/skbuff.h                        |  7 +++--
 include/uapi/linux/acct.h                     |  2 ++
 include/uapi/linux/taskstats.h                |  6 +++-
 kernel/acct.c                                 |  4 ++-
 kernel/tsacct.c                               |  9 ++++--
 net/compat.c                                  |  2 +-
 net/ipv4/tcp.c                                | 28 +++++++++++--------
 net/netfilter/nft_meta.c                      | 10 +++----
 net/packet/af_packet.c                        | 27 +++++++++++-------
 net/socket.c                                  |  2 +-
 34 files changed, 184 insertions(+), 124 deletions(-)

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
Cc: edumazet@google.com
Cc: pablo@netfilter.org
Cc: kadlec@netfilter.org
Cc: fw@strlen.de
Cc: willemb@google.com
Cc: viro@zeniv.linux.org.uk
Cc: rfontana@redhat.com
Cc: tglx@linutronix.de
Cc: linux-um@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux1394-devel@lists.sourceforge.net
Cc: etnaviv@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org>
Cc: linux-arm-msm@vger.kernel.org>
Cc: freedreno@lists.freedesktop.org>
Cc: devel@driverdev.osuosl.org>
Cc: cluster-devel@redhat.com>
Cc: linux-fsdevel@vger.kernel.org>
Cc: netdev@vger.kernel.org>
Cc: netfilter-devel@vger.kernel.org>
Cc: coreteam@netfilter.org>

