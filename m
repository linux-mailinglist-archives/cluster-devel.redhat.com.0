Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 659A435BAF1
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Apr 2021 09:40:12 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-VeVDA1eePXan8ImXMVGoYA-1; Mon, 12 Apr 2021 03:40:09 -0400
X-MC-Unique: VeVDA1eePXan8ImXMVGoYA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4D8487A83B;
	Mon, 12 Apr 2021 07:40:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D1C865C559;
	Mon, 12 Apr 2021 07:40:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B17835534C;
	Mon, 12 Apr 2021 07:40:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13C7c2Ix015412 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 12 Apr 2021 03:38:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 783132182DEF; Mon, 12 Apr 2021 07:38:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 70CFA2182DED
	for <cluster-devel@redhat.com>; Mon, 12 Apr 2021 07:37:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67E4A811E93
	for <cluster-devel@redhat.com>; Mon, 12 Apr 2021 07:37:59 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-473-bQalT4UlNq6YkNIk7kGrYw-1; Mon, 12 Apr 2021 03:37:57 -0400
X-MC-Unique: bQalT4UlNq6YkNIk7kGrYw-1
Received: by mail-wm1-f53.google.com with SMTP id
	j4-20020a05600c4104b029010c62bc1e20so6264833wmi.3
	for <cluster-devel@redhat.com>; Mon, 12 Apr 2021 00:37:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=HIQ9nS2DnwZgvR48t9GVmzUOt4mImx9+3jm/clQDwpY=;
	b=UhbFJmS+PSyFTp+ZiKUfHcq0+4uBUqJAR8yTITMKZqANw4R6HwoXme2Hht+ekGsYm8
	wVIrBs08qLPPZhYnqI9fV8nUyUm4+j3NaRJ/rNcZFnE6UkmhFUHtpwCzR+7zlivfHXIs
	psU1vhISk6i9mUt2QPULCiqHjqBBLzSRTGLxWNQGetjKLLKzTxI9r79KrhtwA/MWvqm2
	wcN8nkMwmY+ClOQ2VO4uJNhnyqCFrwCO4mLonP5+N1nUmyKFZrCvMJF7eiSh4C9X3GJT
	Tn3ITz+IXd017T5NV9Ni9INvbXPNxo1bgZ8cwEF0ns9Z5IZEChv7TyiyhqueyFz91uYT
	HS2g==
X-Gm-Message-State: AOAM531rNzuBqAclQGZ6+0qlTawTzhurk/q8vO8YQcmN9sVQVa0kV5tU
	pZhCf+B4/4LCBKTNtYIaS+SAEw==
X-Google-Smtp-Source: ABdhPJwjS/qzIbhP6Zi3YtFpCzdnzG3pyEYGlKEP/6TmD6q9pko48oi0coPJ+NgMiMrgN0VAVE6f+A==
X-Received: by 2002:a7b:c195:: with SMTP id y21mr2482976wmi.178.1618213076201; 
	Mon, 12 Apr 2021 00:37:56 -0700 (PDT)
Received: from dell ([91.110.221.215]) by smtp.gmail.com with ESMTPSA id
	o5sm13676490wmc.44.2021.04.12.00.37.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 12 Apr 2021 00:37:55 -0700 (PDT)
Date: Mon, 12 Apr 2021 08:37:54 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20210412073754.GA4869@dell>
References: <20210326091151.311647-1-lee.jones@linaro.org>
	<20210406091126.GT2916463@dell>
	<468723920.4255981.1617709446972.JavaMail.zimbra@redhat.com>
	<20210406115434.GU2916463@dell>
	<CAHc6FU4bH91pWgFMytuvhgkr9YJs_VdggZdjEC6EwQJ-9Jj+3Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHc6FU4bH91pWgFMytuvhgkr9YJs_VdggZdjEC6EwQJ-9Jj+3Q@mail.gmail.com>
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
Cc: cluster-devel <cluster-devel@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH 00/18] Rid W=1 warnings from GFS2
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, 09 Apr 2021, Andreas Gruenbacher wrote:

> Hi Lee,
> 
> On Tue, Apr 6, 2021 at 1:54 PM Lee Jones <lee.jones@linaro.org> wrote:
> > > > These have been on the list for a couple of weeks now.
> 
> thanks for your fixes, I've gone through them now. I've fixed up some
> comments instead of "demoting" them to make the patch somewhat less
> destructive, and I found a few more minor issues along the way. Those
> changes are now all in the following commit:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git/commit/?id=c551f66c5dfef

You squashed all of the changes across all of the files into
one-big-patch (tm)?  I haven't seen anyone do that for years.
Hopefully none of it needs reverting or bisecting!

Anyway, thanks for merging.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

