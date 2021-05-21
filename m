Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id F3FB738C025
	for <lists+cluster-devel@lfdr.de>; Fri, 21 May 2021 08:58:43 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-9hmqwJgHNk-SmeBVXg-F_Q-1; Fri, 21 May 2021 02:58:41 -0400
X-MC-Unique: 9hmqwJgHNk-SmeBVXg-F_Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58E86801106;
	Fri, 21 May 2021 06:58:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE03B5D9DE;
	Fri, 21 May 2021 06:58:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 25BCF44A5A;
	Fri, 21 May 2021 06:58:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14L6wUBq032681 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 21 May 2021 02:58:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6AD3210ABC87; Fri, 21 May 2021 06:58:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 65BAD10A85BD
	for <cluster-devel@redhat.com>; Fri, 21 May 2021 06:58:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD83280122D
	for <cluster-devel@redhat.com>; Fri, 21 May 2021 06:58:27 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-47-722FFYbyMqiDedLppQlJ4A-1; Fri, 21 May 2021 02:58:25 -0400
X-MC-Unique: 722FFYbyMqiDedLppQlJ4A-1
Received: by mail-wm1-f41.google.com with SMTP id t206so10522409wmf.0
	for <cluster-devel@redhat.com>; Thu, 20 May 2021 23:58:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=ZW5/iNaO6W6odBCX7nfGezrTMUSd2JvBSBFQHc528eg=;
	b=dsiPgyKCn7pff2zOUeDIfmnrTscz/th4Y8BG6psOwSzIFVZ10rywj3e+j6MkZXLDg/
	XAO5cDmCm4Zl1+ta1GqHWobsvtNdgOlWwRsxQhzGZaR5y3rP1jS5w0LoN4ZCwwEEL27y
	B1gQ2SPv8qHVl849RGU0Tbdtodkhaydq9EuA1b9mdGj23JvD0PRxJwKZ99OCr5HcwiG3
	vfOY7bmKWOHOy5sHksWmh1lX9tIhRO88r+43IRb3KDttWHYEOsAa8NmFRzhVExUyf/vt
	jITNV29hpaGbrVD327dZoMWNz0V3TbcS5gSe53yjp8W3DXGHMbkhfE/WUMaflw7kYwrp
	f5QQ==
X-Gm-Message-State: AOAM531AlXgyEbe4Lg+nThlNmuWZuclLQCVok1WcMYXPzfM6NK/RoJEu
	FAlCHjrijMwtZ8sntYF237bPaA==
X-Google-Smtp-Source: ABdhPJzfq8PHDwVuWKkaoEi/S4jGHfUdKwKFFtn21R+z4N/KjrGLrmznw97NWFsMNKCjFb/YJJ75nA==
X-Received: by 2002:a05:600c:290b:: with SMTP id
	i11mr7732339wmd.34.1621580304421; 
	Thu, 20 May 2021 23:58:24 -0700 (PDT)
Received: from dell ([91.110.221.215])
	by smtp.gmail.com with ESMTPSA id f12sm957661wre.88.2021.05.20.23.58.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 May 2021 23:58:24 -0700 (PDT)
Date: Fri, 21 May 2021 07:58:22 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20210521065822.GP2549456@dell>
References: <20210520120043.3462759-1-lee.jones@linaro.org>
	<20210520120043.3462759-3-lee.jones@linaro.org>
	<CAHc6FU429=1Hzoghqo3=hqkSSmja3+ujna=mE_-Ro=KOMTPecg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHc6FU429=1Hzoghqo3=hqkSSmja3+ujna=mE_-Ro=KOMTPecg@mail.gmail.com>
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
Cc: cluster-devel <cluster-devel@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH 02/15] fs: gfs2: glock: Fix some
 deficient kernel-doc headers and demote non-conformant ones
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, 21 May 2021, Andreas Gruenbacher wrote:

> On Thu, May 20, 2021 at 2:00 PM Lee Jones <lee.jones@linaro.org> wrote:
> > Fixes the following W=1 kernel build warning(s):
> >
> >  fs/gfs2/glock.c:365: warning: Function parameter or member 'gl' not described in 'do_error'
> >  fs/gfs2/glock.c:365: warning: Function parameter or member 'ret' not described in 'do_error'
> >  fs/gfs2/glock.c:461: warning: Function parameter or member 'new_state' not described in 'state_change'
> >  fs/gfs2/glock.c:1277: warning: Function parameter or member 'delay' not described in 'handle_callback'
> >  fs/gfs2/glock.c:1277: warning: Function parameter or member 'remote' not described in 'handle_callback'
> >  fs/gfs2/glock.c:1578: warning: Function parameter or member 'p' not described in 'nq_m_sync'
> >  fs/gfs2/glock.c:1993: warning: Excess function parameter 'wait' description in 'gfs2_gl_hash_clear'
> 
> What's that? Those warnings don't exist in mainline, and the two
> warnings we have in mainline are fixed in for-next:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git/commit/?h=for-next&id=75069590915f2

Thanks for the heads-up Andreas.

This is a rebased set that was authored last cycle.

It's great that someone has been through and fixed these already.

Tell me, is that just the case for this patch, or the whole set?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

