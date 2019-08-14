Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 775C28DF23
	for <lists+cluster-devel@lfdr.de>; Wed, 14 Aug 2019 22:45:23 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A09AA64469;
	Wed, 14 Aug 2019 20:45:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 85C9782091;
	Wed, 14 Aug 2019 20:45:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3A2522551C;
	Wed, 14 Aug 2019 20:45:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7EKj03A004970 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 14 Aug 2019 16:45:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 73EB740EF9; Wed, 14 Aug 2019 20:45:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B990027BCC;
	Wed, 14 Aug 2019 20:44:57 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C46B030C3400;
	Wed, 14 Aug 2019 20:44:56 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
	(mreue010 [212.227.15.129]) with ESMTPA (Nemesis) id
	1M7Jj2-1huhHR2fpk-007orl; Wed, 14 Aug 2019 22:44:25 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk,
	linux-fsdevel@vger.kernel.org, Bob Peterson <rpeterso@redhat.com>,
	Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 14 Aug 2019 22:42:30 +0200
Message-Id: <20190814204259.120942-4-arnd@arndb.de>
In-Reply-To: <20190814204259.120942-1-arnd@arndb.de>
References: <20190814204259.120942-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:hGXDAxI7hFLVZ85cfnbZ5sHaSt06xrX/1XrFOyFm8J2VKLQB1xL
	hBlQ8eE8iy72h9XotCxexOE5vXgZNGCjvcELLBjVkIB7tPAfgy8TLWA63BTsyMQCgpafBDx
	jZ0RNjuG6UZOVeDWg0FNwnOOT9H3LwypCg9fmWIZJhiGV5jDAyBZ3xyqwXFe+8CVyaerHC9
	lXslO82tG51uc8cuCC8kQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8ZMJQ62I2nQ=:8iOcgb599uCKvsk3CfwfHr
	YoBxiVH0msauRk9nhPND2dv96UWgpbxfbtP0w7F0QLjQy+K7o2h8T55mcoXKv8Mvrn5JSOFp4
	HLq6u++mmMvVXYbiUKJ3ES+7vWWuqHvfTDmoKdgrAp2asQssIy33P4wB2gTDK++1sx7jHg7Ae
	Oltncw5miJqx9TiiAcurDTKS7cWDsghzKMj3p7DwOuHePlbBJsdlzFRA7vDVyXT7dnexHt6vI
	C2IIoLYYN7ed8Q0df/gag9j/niysF3ESIFJvD/VU59ml0s608eo3BMIcT3tCG5ONFeXBUTMwk
	TWcKN0L3Fyr9SMCepXxl8AT9rouJfNz/+RrWskxCCkwTNhcVrk4eDHudyfWBUZabK9WnUXHxh
	VdTvIXRpQ1jyJMy0/Yj9nLqD4kb1YU2XezLvq3XCmjlOHKNwYDUd+mOfv6YtNCBNeI6nDL2UC
	5yriW4CxBZFiK6v79N8PSdAz98Ptoj0rZhbBRQccgW5dQ1lShmYa33cnLeujFYa5CsKsZmwvN
	oUEtYpDHWfs/RqgrZsTlePvMiETsUyKFhfiwJff6a8NjMfPXeeeknzbV1ufnYLnd3cSjiy1YT
	DVLrx2CqRzP9SHu0PgvhzdVUz3N4NulhDKwD8HXcORdRnZ7AZEYN2/IoxrenMtsqyD3wcHiAh
	ClbX2gXgbHQ1QvW9E1H43hcUJ831wxWHZ4l3iEgImJs6HwoaiJmG6kDFyliA8n7l7bBskqj+m
	64cSfdymf8LL2fgPCbtKM8TB2Etv4Oo8Kq1A4g==
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.49]); Wed, 14 Aug 2019 20:44:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Wed, 14 Aug 2019 20:44:57 +0000 (UTC) for IP:'212.227.126.133'
	DOMAIN:'mout.kundenserver.de' HELO:'mout.kundenserver.de'
	FROM:'arnd@arndb.de' RCPT:''
X-RedHat-Spam-Score: 0.002  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_NONE) 212.227.126.133 mout.kundenserver.de
	212.227.126.133 mout.kundenserver.de <arnd@arndb.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, Arnd Bergmann <arnd@arndb.de>,
	"Darrick J. Wong" <darrick.wong@oracle.com>,
	NeilBrown <neilb@suse.com>, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v5 03/18] gfs2: add compat_ioctl support
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Wed, 14 Aug 2019 20:45:21 +0000 (UTC)

Out of the four ioctl commands supported on gfs2, only FITRIM
works in compat mode.

Add a proper handler based on the ext4 implementation.

Fixes: 6ddc5c3ddf25 ("gfs2: getlabel support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 fs/gfs2/file.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 52fa1ef8400b..49287f0b96d0 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -6,6 +6,7 @@
 
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/compat.h>
 #include <linux/completion.h>
 #include <linux/buffer_head.h>
 #include <linux/pagemap.h>
@@ -354,6 +355,25 @@ static long gfs2_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 	return -ENOTTY;
 }
 
+#ifdef CONFIG_COMPAT
+static long gfs2_compat_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
+{
+	/* These are just misnamed, they actually get/put from/to user an int */
+	switch(cmd) {
+	case FS_IOC32_GETFLAGS:
+		cmd = FS_IOC_GETFLAGS;
+		break;
+	case FS_IOC32_SETFLAGS:
+		cmd = FS_IOC_SETFLAGS;
+		break;
+	}
+
+	return gfs2_ioctl(filp, cmd, (unsigned long)compat_ptr(arg));
+}
+#else
+#define gfs2_compat_ioctl NULL
+#endif
+
 /**
  * gfs2_size_hint - Give a hint to the size of a write request
  * @filep: The struct file
@@ -1294,6 +1314,7 @@ const struct file_operations gfs2_file_fops = {
 	.write_iter	= gfs2_file_write_iter,
 	.iopoll		= iomap_dio_iopoll,
 	.unlocked_ioctl	= gfs2_ioctl,
+	.compat_ioctl	= gfs2_compat_ioctl,
 	.mmap		= gfs2_mmap,
 	.open		= gfs2_open,
 	.release	= gfs2_release,
@@ -1309,6 +1330,7 @@ const struct file_operations gfs2_file_fops = {
 const struct file_operations gfs2_dir_fops = {
 	.iterate_shared	= gfs2_readdir,
 	.unlocked_ioctl	= gfs2_ioctl,
+	.compat_ioctl	= gfs2_compat_ioctl,
 	.open		= gfs2_open,
 	.release	= gfs2_release,
 	.fsync		= gfs2_fsync,
@@ -1325,6 +1347,7 @@ const struct file_operations gfs2_file_fops_nolock = {
 	.write_iter	= gfs2_file_write_iter,
 	.iopoll		= iomap_dio_iopoll,
 	.unlocked_ioctl	= gfs2_ioctl,
+	.compat_ioctl	= gfs2_compat_ioctl,
 	.mmap		= gfs2_mmap,
 	.open		= gfs2_open,
 	.release	= gfs2_release,
@@ -1338,6 +1361,7 @@ const struct file_operations gfs2_file_fops_nolock = {
 const struct file_operations gfs2_dir_fops_nolock = {
 	.iterate_shared	= gfs2_readdir,
 	.unlocked_ioctl	= gfs2_ioctl,
+	.compat_ioctl	= gfs2_compat_ioctl,
 	.open		= gfs2_open,
 	.release	= gfs2_release,
 	.fsync		= gfs2_fsync,
-- 
2.20.0

