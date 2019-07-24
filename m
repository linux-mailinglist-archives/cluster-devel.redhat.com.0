Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B804E72A6E
	for <lists+cluster-devel@lfdr.de>; Wed, 24 Jul 2019 10:50:11 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5301D81DF2;
	Wed, 24 Jul 2019 08:50:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 015D86092D;
	Wed, 24 Jul 2019 08:50:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9C8B91800206;
	Wed, 24 Jul 2019 08:50:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6O8o7wC027933 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 24 Jul 2019 04:50:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 421055C231; Wed, 24 Jul 2019 08:50:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E14CE5C225;
	Wed, 24 Jul 2019 08:50:04 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5FCEAC0A4F49;
	Wed, 24 Jul 2019 08:50:03 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id r7so20595622pfl.3;
	Wed, 24 Jul 2019 01:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:cc:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding:content-language;
	bh=rN+948Su3EXVIwlWiX6QSbAmB2jjxztNI2MmhRW+gZo=;
	b=RxgiEAG2xV3+3v5ltN1ukOKKVHulDr35PZCXEI4mINwh5Ew50bPQhDb/WCJb4hflk3
	sGoD6XGaCcoJdYl9OUvIp0NCwFMWvUUgEel5OYs8495RSbYqX8LVJ9d4zOPHN+BxSpWP
	NROcC11G0gWUwMFRfZYuJoVxdspu/kl5jog+IxRl9R6YOkv3TCMxav0/T104E2XG3hg+
	GJpWwaHVBjE00dM3Rj7nDhyVuGHWLJkzStvP8e6UjLgGZq7W8EfiVwLNfxpE4J9VSOk1
	z+NnZpt2LoS3W8ksc7gEyMaJOLw921IMS3CF5feq3ktXRv0SEwzRcYvAqRgkQj0Abtg0
	k0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding:content-language;
	bh=rN+948Su3EXVIwlWiX6QSbAmB2jjxztNI2MmhRW+gZo=;
	b=RzcNvIiWBos7UD+xPA0Lmys8WGBtjnhRfhKj/8PBbSTLml1HBsFpPygyOnCN5CPy8x
	+XM+s81QoIidAmfo/5Tu0h69wTxkuENltsRXjTC+gFTO9fsS17cYgtEaZAz2Sh1Krw3X
	SIG8S5NC3+PDX6Q5MHBf89bVDEdwYwHqD75pd5BVkSXM81zvUtrBedEoKz0OBsW5JpY2
	6/JLVbKgDBK9K6C427B/H/lhp47KwbSUxzyfIEJr7KMAlg0yaFAEFSKzLRaXFSB5Vrx6
	LiJ7LjEdRZAVqeorBuKyBBHShs5ydt9xh+cvNhartuUNuUBzJPKJuBhnxPvi595qdua6
	nEEA==
X-Gm-Message-State: APjAAAVEQzjc6QAwlC60QgSkM/Fsr4G2tGVkGpjpnPcqO7T26R+LDZus
	BIJKn2kkp4KTtZbmBlCRIuD6q+IzDsg=
X-Google-Smtp-Source: APXvYqzeCNO9lcvlPHi+hU5vR51IR2zY1n9lFHNsjQTiduxJ1SbBU4qV4MOx3q8STOLsEIwm4UOQZA==
X-Received: by 2002:a65:4808:: with SMTP id h8mr79526364pgs.22.1563958202860; 
	Wed, 24 Jul 2019 01:50:02 -0700 (PDT)
Received: from ?IPv6:2402:f000:4:72:808::177e? ([2402:f000:4:72:808::177e])
	by smtp.gmail.com with ESMTPSA id
	85sm47011924pfv.130.2019.07.24.01.50.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Jul 2019 01:50:02 -0700 (PDT)
To: rpeterso@redhat.com, agruenba@redhat.com
From: Jia-Ju Bai <baijiaju1990@gmail.com>
Message-ID: <8d270882-54da-365e-1be7-a291a5178b1e@gmail.com>
Date: Wed, 24 Jul 2019 16:50:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 24 Jul 2019 08:50:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]);
	Wed, 24 Jul 2019 08:50:03 +0000 (UTC) for IP:'209.85.210.171'
	DOMAIN:'mail-pf1-f171.google.com'
	HELO:'mail-pf1-f171.google.com' FROM:'baijiaju1990@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.151  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.210.171 mail-pf1-f171.google.com 209.85.210.171
	mail-pf1-f171.google.com <baijiaju1990@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.32
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [BUG] fs: gfs2: possible null-pointer dereferences
 in gfs2_rgrp_bh_get()
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Wed, 24 Jul 2019 08:50:10 +0000 (UTC)

In gfs2_rgrp_bh_get, there is an if statement on line 1191 to check 
whether "rgd->rd_bits[0].bi_bh" is NULL.
When "rgd->rd_bits[0].bi_bh" is NULL, it is used on line 1216:
     gfs2_rgrp_in(rgd, (rgd->rd_bits[0].bi_bh)->b_data);
and on line 1225:
     gfs2_rgrp_ondisk2lvb(..., rgd->rd_bits[0].bi_bh->b_data);
and on line 1228:
     if (!gfs2_rgrp_lvb_valid(rgd))

Note that in gfs2_rgrp_lvb_valid(rgd), there is a statement on line 1114:
     struct gfs2_rgrp *str = (struct gfs2_rgrp 
*)rgd->rd_bits[0].bi_bh->b_data;

Thus, possible null-pointer dereferences may occur.

These bugs are found by a static analysis tool STCheck written by us.
I do not know how to correctly fix these bugs, so I only report bugs.


Best wishes,
Jia-Ju Bai

