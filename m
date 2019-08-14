Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF308DF22
	for <lists+cluster-devel@lfdr.de>; Wed, 14 Aug 2019 22:45:14 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 003EA776FC;
	Wed, 14 Aug 2019 20:45:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B3C883840;
	Wed, 14 Aug 2019 20:45:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5613C18005C7;
	Wed, 14 Aug 2019 20:45:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7EKiiGj004933 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 14 Aug 2019 16:44:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5BDFA1000321; Wed, 14 Aug 2019 20:44:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D85471001B0F;
	Wed, 14 Aug 2019 20:44:41 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4E5A030C1668;
	Wed, 14 Aug 2019 20:44:29 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
	(mreue010 [212.227.15.129]) with ESMTPA (Nemesis) id
	1MJmbB-1hiokV3nNB-00K75E; Wed, 14 Aug 2019 22:43:31 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk,
	linux-fsdevel@vger.kernel.org
Date: Wed, 14 Aug 2019 22:42:27 +0200
Message-Id: <20190814204259.120942-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:xGnsbJFEb5cp5VgCCKba17rABY8rw5YpFHVSp9sUcOzQSe+UXGP
	EfEYa61AjTCAHzUWX6wv2lDU7UbSUWqI2oz4Izzo8ktMHBlxmH8NVFj4hnZmHzHR9j3PmnD
	FdXT0A0EWAS6WaUuOwbDeG9tdQjqBuRZe/Qa9Z37r+1tBtsxN6SEXAY5fO0COcyHnB4qqcA
	G33rmG1j8a0kHXtMGaC3A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lZeESLReWcA=:o8v1Y+WXV56E6iMJG8Ogif
	2FqbIgZz9Cf28eQxkb1FeOSJmjwIDMMG6qZymgcdySt/904oRKzRXaxzdToNS9eKtscmO3Pqe
	/FgBQD2UqihLwK3P/Pddn1urtJAP8i4lHDXy2HhE2jK8dPb6o36J+yFC20qjDEZ2PrwGmI4P+
	eCWYNuv25DY/1Lti33SSmno2KcNiHGryG0RZ4MxsltqQfXdWyvsKej7eST7IWNiMWKhvjyU37
	hE4nHYkj/tcVvmbwEjgJuruEJRODw6lCU7hWqw9twzGmBAmy8QMD8J//vGUTZ4q5+VzF9VhjQ
	bG82fyrhMmJKoue644MCK3h+10nGq6fpc0+zn8mYx07fSdSIGFWt2VJ2pxnSCWgeITy6Ere97
	sRmxqZNBv/e8jpN7Uc0JBjNzz9yYdvbFlJfGeIc2ao4vxcJORGyxhpoqAIRlQzpHC31QgNZum
	edQsMV2appVThHuGv1ov/A9jLW2kPA47ZPWpCcXW+dzl4v7v86+29DJTNjj3mVImCRQNSuJS4
	cAtYqWH6jHUAOn8v98eCWJv3t830ah1HbsJkf7tJ7ckvhUNIWDFHYDwgsfXjt098IoD2AtXor
	PgWxV3iIYDq+x9Wym9Nl2f8rz27kROMPDKgPXeM8TeWHxiZbHQgKAuei5tzhS7HSjk0UKFYhp
	9Oh+W+y+k0I/NRheX6o+PUjcCpNRjNPLHuD9piLtJmz92aChC6F/e9SyB7FzdHKmmf4IcD77K
	7HYEjW+U1QhnWXZOIuSxIrYkaKmPv6aeBud5fA==
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.44]); Wed, 14 Aug 2019 20:44:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Wed, 14 Aug 2019 20:44:29 +0000 (UTC) for IP:'212.227.126.134'
	DOMAIN:'mout.kundenserver.de' HELO:'mout.kundenserver.de'
	FROM:'arnd@arndb.de' RCPT:''
X-RedHat-Spam-Score: 0.002  (SPF_HELO_NONE,
	SPF_NONE) 212.227.126.134 mout.kundenserver.de
	212.227.126.134 mout.kundenserver.de <arnd@arndb.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: alexandre.belloni@bootlin.com, joseph.qi@linux.alibaba.com,
	adilger.kernel@dilger.ca, mikulas@artax.karlin.mff.cuni.cz,
	linux-rtc@vger.kernel.org, linux-nilfs@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, linux-scsi@vger.kernel.org,
	darrick.wong@oracle.com, cluster-devel@redhat.com,
	dgilbert@interlog.com, linux-ext4@vger.kernel.org,
	linux@roeck-us.net, linux-hwmon@vger.kernel.org,
	ecryptfs@vger.kernel.org, linux-watchdog@vger.kernel.org,
	minyard@acm.org, jejb@linux.ibm.com, jslaby@suse.com,
	linux-block@vger.kernel.org, jaegeuk@kernel.org,
	openipmi-developer@lists.sourceforge.net, wim@linux-watchdog.org,
	konishi.ryusuke@gmail.com, axboe@kernel.dk, tytso@mit.edu,
	martin.petersen@oracle.com, gregkh@linuxfoundation.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, netdev@vger.kernel.org,
	davem@davemloft.net, ocfs2-devel@oss.oracle.com, linux-ppp@vger.kernel.org
Subject: [Cluster-devel] [PATCH v5 00/18] compat_ioctl.c removal, part 2/3
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Wed, 14 Aug 2019 20:45:13 +0000 (UTC)

This is a follow-up to part 1/3 that I posted after -rc2.
I hope these are still largely uncontroversial changes, and
I would like to get them into linux-5.4.

Part 1 was in

https://lore.kernel.org/lkml/CAPcyv4i_nHzV155RcgnAQ189aq2Lfd2g8pA1D5NbZqo9E_u+Dw@mail.gmail.com/

Part 3 will be one kernel release after part 2 is merged,
as that still needs a little extra work.

The entire series is available at

git://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git compat_ioctl

      Arnd

Al Viro (2):
  compat_ioctl: unify copy-in of ppp filters
  compat_ioctl: move PPPIOCSCOMPRESS to ppp_generic

Arnd Bergmann (16):
  xfs: compat_ioctl: use compat_ptr()
  xfs: compat_ioctl: add missing conversions
  gfs2: add compat_ioctl support
  fs: compat_ioctl: move FITRIM emulation into file systems
  watchdog: cpwd: use generic compat_ptr_ioctl
  compat_ioctl: move WDIOC handling into wdt drivers
  compat_ioctl: reimplement SG_IO handling
  af_unix: add compat_ioctl support
  compat_ioctl: handle SIOCOUTQNSD
  compat_ioctl: move SIOCOUTQ out of compat_ioctl.c
  tty: handle compat PPP ioctls
  compat_ioctl: handle PPPIOCGIDLE for 64-bit time_t
  compat_ioctl: ppp: move simple commands into ppp_generic.c
  compat_ioctl: move SG_GET_REQUEST_TABLE handling
  pktcdvd: add compat_ioctl handler
  scsi: sd: enable compat ioctls for sed-opal

 Documentation/networking/ppp_generic.txt  |   2 +
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c |   1 +
 arch/um/drivers/harddog_kern.c            |   1 +
 block/scsi_ioctl.c                        | 132 ++++++++-
 drivers/block/pktcdvd.c                   |  25 ++
 drivers/char/ipmi/ipmi_watchdog.c         |   1 +
 drivers/hwmon/fschmd.c                    |   1 +
 drivers/net/ppp/ppp_generic.c             | 245 ++++++++++-----
 drivers/rtc/rtc-ds1374.c                  |   1 +
 drivers/scsi/sd.c                         |  14 +-
 drivers/scsi/sg.c                         |  59 +++-
 drivers/tty/tty_io.c                      |   5 +
 drivers/watchdog/acquirewdt.c             |   1 +
 drivers/watchdog/advantechwdt.c           |   1 +
 drivers/watchdog/alim1535_wdt.c           |   1 +
 drivers/watchdog/alim7101_wdt.c           |   1 +
 drivers/watchdog/ar7_wdt.c                |   1 +
 drivers/watchdog/at91rm9200_wdt.c         |   1 +
 drivers/watchdog/ath79_wdt.c              |   1 +
 drivers/watchdog/bcm63xx_wdt.c            |   1 +
 drivers/watchdog/cpu5wdt.c                |   1 +
 drivers/watchdog/cpwd.c                   |  25 +-
 drivers/watchdog/eurotechwdt.c            |   1 +
 drivers/watchdog/f71808e_wdt.c            |   1 +
 drivers/watchdog/gef_wdt.c                |   1 +
 drivers/watchdog/geodewdt.c               |   1 +
 drivers/watchdog/ib700wdt.c               |   1 +
 drivers/watchdog/ibmasr.c                 |   1 +
 drivers/watchdog/indydog.c                |   1 +
 drivers/watchdog/intel_scu_watchdog.c     |   1 +
 drivers/watchdog/iop_wdt.c                |   1 +
 drivers/watchdog/it8712f_wdt.c            |   1 +
 drivers/watchdog/ixp4xx_wdt.c             |   1 +
 drivers/watchdog/ks8695_wdt.c             |   1 +
 drivers/watchdog/m54xx_wdt.c              |   1 +
 drivers/watchdog/machzwd.c                |   1 +
 drivers/watchdog/mixcomwd.c               |   1 +
 drivers/watchdog/mtx-1_wdt.c              |   1 +
 drivers/watchdog/mv64x60_wdt.c            |   1 +
 drivers/watchdog/nuc900_wdt.c             |   1 +
 drivers/watchdog/nv_tco.c                 |   1 +
 drivers/watchdog/pc87413_wdt.c            |   1 +
 drivers/watchdog/pcwd.c                   |   1 +
 drivers/watchdog/pcwd_pci.c               |   1 +
 drivers/watchdog/pcwd_usb.c               |   1 +
 drivers/watchdog/pika_wdt.c               |   1 +
 drivers/watchdog/pnx833x_wdt.c            |   1 +
 drivers/watchdog/rc32434_wdt.c            |   1 +
 drivers/watchdog/rdc321x_wdt.c            |   1 +
 drivers/watchdog/riowd.c                  |   1 +
 drivers/watchdog/sa1100_wdt.c             |   1 +
 drivers/watchdog/sb_wdog.c                |   1 +
 drivers/watchdog/sbc60xxwdt.c             |   1 +
 drivers/watchdog/sbc7240_wdt.c            |   1 +
 drivers/watchdog/sbc_epx_c3.c             |   1 +
 drivers/watchdog/sbc_fitpc2_wdt.c         |   1 +
 drivers/watchdog/sc1200wdt.c              |   1 +
 drivers/watchdog/sc520_wdt.c              |   1 +
 drivers/watchdog/sch311x_wdt.c            |   1 +
 drivers/watchdog/scx200_wdt.c             |   1 +
 drivers/watchdog/smsc37b787_wdt.c         |   1 +
 drivers/watchdog/w83877f_wdt.c            |   1 +
 drivers/watchdog/w83977f_wdt.c            |   1 +
 drivers/watchdog/wafer5823wdt.c           |   1 +
 drivers/watchdog/watchdog_dev.c           |   1 +
 drivers/watchdog/wdrtas.c                 |   1 +
 drivers/watchdog/wdt.c                    |   1 +
 drivers/watchdog/wdt285.c                 |   1 +
 drivers/watchdog/wdt977.c                 |   1 +
 drivers/watchdog/wdt_pci.c                |   1 +
 fs/compat_ioctl.c                         | 346 +---------------------
 fs/ecryptfs/file.c                        |   1 +
 fs/ext4/ioctl.c                           |   1 +
 fs/f2fs/file.c                            |   1 +
 fs/gfs2/file.c                            |  24 ++
 fs/hpfs/dir.c                             |   1 +
 fs/hpfs/file.c                            |   1 +
 fs/nilfs2/ioctl.c                         |   1 +
 fs/ocfs2/ioctl.c                          |   1 +
 fs/xfs/xfs_ioctl32.c                      |  11 +-
 include/linux/blkdev.h                    |   2 +
 include/uapi/linux/ppp-ioctl.h            |   2 +
 include/uapi/linux/ppp_defs.h             |  14 +
 lib/iov_iter.c                            |   1 +
 net/socket.c                              |   3 +
 net/unix/af_unix.c                        |  19 ++
 86 files changed, 526 insertions(+), 472 deletions(-)

-- 
2.20.0

Cc: davem@davemloft.net
Cc: axboe@kernel.dk
Cc: linux-block@vger.kernel.org
Cc: minyard@acm.org
Cc: gregkh@linuxfoundation.org
Cc: linux@roeck-us.net
Cc: alexandre.belloni@bootlin.com
Cc: jejb@linux.ibm.com
Cc: martin.petersen@oracle.com
Cc: dgilbert@interlog.com
Cc: jslaby@suse.com
Cc: wim@linux-watchdog.org
Cc: viro@zeniv.linux.org.uk
Cc: tytso@mit.edu
Cc: adilger.kernel@dilger.ca
Cc: jaegeuk@kernel.org
Cc: rpeterso@redhat.com
Cc: agruenba@redhat.com
Cc: mikulas@artax.karlin.mff.cuni.cz
Cc: konishi.ryusuke@gmail.com
Cc: jlbec@evilplan.org
Cc: joseph.qi@linux.alibaba.com
Cc: darrick.wong@oracle.com
Cc: linux-xfs@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: openipmi-developer@lists.sourceforge.net
Cc: linux-hwmon@vger.kernel.org
Cc: linux-ppp@vger.kernel.org
Cc: linux-rtc@vger.kernel.org
Cc: linux-scsi@vger.kernel.org
Cc: linux-watchdog@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org
Cc: ecryptfs@vger.kernel.org
Cc: linux-ext4@vger.kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net
Cc: cluster-devel@redhat.com
Cc: linux-nilfs@vger.kernel.org
Cc: ocfs2-devel@oss.oracle.com

