Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D29583FC
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Jun 2019 15:59:00 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 78ED0309265B;
	Thu, 27 Jun 2019 13:58:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB7045D719;
	Thu, 27 Jun 2019 13:58:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7CBC6206D7;
	Thu, 27 Jun 2019 13:58:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5RDvxTs008131 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 27 Jun 2019 09:57:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 83A655C296; Thu, 27 Jun 2019 13:57:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 21ACE5C231;
	Thu, 27 Jun 2019 13:57:57 +0000 (UTC)
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B6AA04623E;
	Thu, 27 Jun 2019 13:57:45 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id k8so4967389iot.1;
	Thu, 27 Jun 2019 06:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/XyALr5qJRsJTMcLA/D+aC0kMlYtWn91PnkhNGpSRtM=;
	b=TARbsryt5eoK7wH3/0VoLs9AjeUYpobcuF4ODQ+DWtG18hc32alo/6Fha/qPWCQJ0Y
	sxRqw3LuY+1e07fKhS95PEi8W2l8/O0QD6WyURMMD+oXr+UC7saUgs7XRKFuOMnu9yYH
	xg+qMr2R497swI7SAV8IrKb8C/nFt40C2XvvHhPOUXYpSwjUZ5AgZtypX/oJ86SMSJBE
	m7VFnuhaG05hHX8r9soUjDtuh+zdTJ/gJqXhOlMv9WI4NJjcf/tMQFIkOi0iRRJlMpP8
	muIFOfLXPS1NMgj9J8vPWEpLB2zqF8wh/OhAtkDeVEWBWXy/TGGF9ta6nbT6xZaeKre/
	9Img==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/XyALr5qJRsJTMcLA/D+aC0kMlYtWn91PnkhNGpSRtM=;
	b=ZNwcyqghPcN/ySuzvNfR2ybWje1S/bcBDJPHiQ9ra+TRSejtq52G9uICcM7zLNIdmw
	zs5kI1r9domEW6LxKG5wSjEINyYxliYRWghokpHOGoRiwTemHX3pWz7wZBJ5h9cRHmh8
	+GuIQsIh9iUI2CRmk32htmcMSMXrXOwxyT3SR47CSXocfFcbuMSTZI4OyVh7jCWvXJoe
	JIIK2t2NXdC3lYkJUFxbL4wmNnXSbSXbQ+pb8dkCdAT5I786KgS7oiEAclQmdJNfv0Jf
	EaOyx3IWKGJ588jofFHQF6ND339t4ulXl2y3+6WMHhD7pvd6SRC/9emBatgJ2eUaM61M
	+p+Q==
X-Gm-Message-State: APjAAAWaGn3yoV2fhB9rnxK0yOGP/9QDNC4R+b6El2Hhafv/Fp+dlJ73
	kn8Tt5vq1T/hEOvRRFuCbSG2P+6aK/P1h2jEh7ZoRotb
X-Google-Smtp-Source: APXvYqyE7mm8EAZx9kCmIftM3PSFefXChkPMObDwk0LccEKSxDMufjhyaxWFITvm9tFc8tln6uJLGaUPqyZt9Oo3gNY=
X-Received: by 2002:a02:7420:: with SMTP id o32mr4850594jac.117.1561643865009; 
	Thu, 27 Jun 2019 06:57:45 -0700 (PDT)
MIME-Version: 1.0
References: <1561604670-11476-1-git-send-email-yang.bin18@zte.com.cn>
In-Reply-To: <1561604670-11476-1-git-send-email-yang.bin18@zte.com.cn>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Thu, 27 Jun 2019 15:57:33 +0200
Message-ID: <CAHpGcM+6p_TtHh=YSa1Mxyjr+w+V5_8RR2TgnN-s5TbbHjGhng@mail.gmail.com>
To: Yang Bin <yang.bin18@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 27 Jun 2019 13:57:45 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Thu, 27 Jun 2019 13:57:45 +0000 (UTC) for IP:'209.85.166.67'
	DOMAIN:'mail-io1-f67.google.com' HELO:'mail-io1-f67.google.com'
	FROM:'andreas.gruenbacher@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.109  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.166.67 mail-io1-f67.google.com 209.85.166.67
	mail-io1-f67.google.com <andreas.gruenbacher@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, wang.yi59@zte.com.cn,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH] sub sd_rgrps When clear rgrp
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Thu, 27 Jun 2019 13:58:59 +0000 (UTC)

Hi Yang Bin,

Am Do., 27. Juni 2019 um 05:08 Uhr schrieb Yang Bin <yang.bin18@zte.com.cn>:
> From: " Yang Bin "<yang.bin18@zte.com.cn>
>
> When clear rgrp,sub sd_rgrps after erased from rindex_tree

this patch isn't incorrect, but all it does it ensure that sd_rgrps
reaches zero before we destroy a struct gfs2_sbd. However, sd_rgrps is
only ever used when a filesystem is active, and while that is the
case, it can never decrease. It will grow when the filesystem is grown
though.

So what are you trying to achieve with this patch?

> Signed-off-by: Yang Bin <yang.bin18@zte.com.cn>
> ---
>  fs/gfs2/rgrp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
> index 15d6e32..a4b2e83
> --- a/fs/gfs2/rgrp.c
> +++ b/fs/gfs2/rgrp.c
> @@ -730,6 +730,7 @@ void gfs2_clear_rgrpd(struct gfs2_sbd *sdp)
>                 gl = rgd->rd_gl;
>
>                 rb_erase(n, &sdp->sd_rindex_tree);
> +               sdp->sd_rgrps--;
>
>                 if (gl) {
>                         glock_clear_object(gl, rgd);
> --
> 1.8.3.1
>

Thanks,
Andreas

