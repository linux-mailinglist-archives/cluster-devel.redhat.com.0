Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9994917281
	for <lists+cluster-devel@lfdr.de>; Wed,  8 May 2019 09:22:48 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0719EC057E3A;
	Wed,  8 May 2019 07:22:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 21FAF5C28D;
	Wed,  8 May 2019 07:22:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 76D3F18089CA;
	Wed,  8 May 2019 07:22:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x481n1uo012284 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 7 May 2019 21:49:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7B91C1001DCD; Wed,  8 May 2019 01:49:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D5921001E6F;
	Wed,  8 May 2019 01:48:59 +0000 (UTC)
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A7764C057E3A;
	Wed,  8 May 2019 01:48:58 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id p18so1014772itm.1;
	Tue, 07 May 2019 18:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=o7lcyB5s0oTEYvy3/wHbgG7UILE/7QogHJKGt1FxaBM=;
	b=L6ZI9PRIK8DoLR58x1qB/Lw9xq543AAQprEDzs/cg+03ifpuGgsmRzrjX63HCBsjv9
	KfYtHyc7CJwOA9FlfNy0Z45pwr/Ku927wvXIasxUPybmvW16TTPbAIRO0hu7afSl0al3
	uxZjQhdZHiULov9X9eK+jn8zDeifTLZzlb6Trk9qXXo76nFPjzWYzTQifXsKmxnNlGiD
	SqAaKhP4WEFndLPX+nLxL9heO/n8mhzhRUEpLyJIC2VHJZLHEpPSdPnghcZ3DWDMCJ3I
	4meHp0cyCUBJ10WnUWHXT/B58vwCx3wmDP+opfDX+Ufk5M3v9w98d3zubuXn9trTTqBR
	yG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=o7lcyB5s0oTEYvy3/wHbgG7UILE/7QogHJKGt1FxaBM=;
	b=TDNzRWEDlBTJc5YzmkvDMMGsX2b/IOAF8J5RKa6Qp/lFeu8uPonDC5gajH0uaeKwI7
	3rGoKxrYFCy09xkYf7XlzUF+mlCnb+ZdlXbU9sAUG3HOUOyAsfB1ygUJEiOjUv6JUOfk
	YkVH5wfF/Dfh6AOJ1pFE2XujgZNi8SEOu33Tv2Wlt4USAZDCQU7QaorhqqH7ACCXuI+/
	olUz/fqfS6oNWEsv/O8Ecb4owuZWnm3tvJbJ5C3T94AX5WROFG1nnbk+Qh2AAZsx7EBn
	8ce7JrfQkygu5byZeS3d7zdxcR/6yrdVlbE7zXBHzZHMZjPvdj3bVyyjAm2OOLN70kae
	muYQ==
X-Gm-Message-State: APjAAAWCyHLo1EwmpypUE/LWaPWIkvkI/mxkE47n9L+cdS5e6UY261co
	w+VYtPTt1CV/BrPrF5bornJFUThn9mY=
X-Google-Smtp-Source: APXvYqxvQgjj28jgLRfY2BL7CgVmEj527sBLG1fKApNyOjUsz3dhX3wUGBgSVcCrfwP0qig61eJpIA==
X-Received: by 2002:a02:8815:: with SMTP id r21mr2015578jai.88.1557280137987; 
	Tue, 07 May 2019 18:48:57 -0700 (PDT)
Received: from ubu (2600-6c48-437f-c81d-f514-433e-0658-d461.dhcp6.chtrptr.net.
	[2600:6c48:437f:c81d:f514:433e:658:d461])
	by smtp.gmail.com with ESMTPSA id c72sm446207itc.22.2019.05.07.18.48.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 07 May 2019 18:48:57 -0700 (PDT)
From: Kimberly Brown <kimbrownkd@gmail.com>
To: Christine Caulfield <ccaulfie@redhat.com>,
	David Teigland <teigland@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue,  7 May 2019 21:48:05 -0400
Message-Id: <20190508014805.28715-1-kimbrownkd@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 08 May 2019 01:48:58 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Wed, 08 May 2019 01:48:58 +0000 (UTC) for IP:'209.85.166.194'
	DOMAIN:'mail-it1-f194.google.com'
	HELO:'mail-it1-f194.google.com' FROM:'kimbrownkd@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.111  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_PASS) 209.85.166.194 mail-it1-f194.google.com 209.85.166.194
	mail-it1-f194.google.com <kimbrownkd@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Wed, 08 May 2019 03:22:16 -0400
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH] dlm: Replace default_attrs in dlm_ktype
	with default_groups
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Wed, 08 May 2019 07:22:47 +0000 (UTC)

The kobj_type default_attrs field is being replaced by the
default_groups field, so replace the default_attrs field in dlm_ktype
with default_groups. Use the ATTRIBUTE_GROUPS macro to create
dlm_groups.

Signed-off-by: Kimberly Brown <kimbrownkd@gmail.com>
---

This patch depends on a patch in the driver-core tree: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git/commit/?h=driver-core-next&id=aa30f47cf666111f6bbfd15f290a27e8a7b9d854

Greg KH can take this patch through the driver-core tree, or this patch
can wait a release cycle and go through the subsystem's tree, whichever
the subsystem maintainer is more comfortable with.


 fs/dlm/lockspace.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index db43b98c4d64..762f08bb2bf2 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -160,6 +160,7 @@ static struct attribute *dlm_attrs[] = {
 	&dlm_attr_recover_nodeid.attr,
 	NULL,
 };
+ATTRIBUTE_GROUPS(dlm);
 
 static ssize_t dlm_attr_show(struct kobject *kobj, struct attribute *attr,
 			     char *buf)
@@ -189,7 +190,7 @@ static const struct sysfs_ops dlm_attr_ops = {
 };
 
 static struct kobj_type dlm_ktype = {
-	.default_attrs = dlm_attrs,
+	.default_groups = dlm_groups,
 	.sysfs_ops     = &dlm_attr_ops,
 	.release       = lockspace_kobj_release,
 };
-- 
2.17.1

