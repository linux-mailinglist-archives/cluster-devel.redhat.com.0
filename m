Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2B54E7D47
	for <lists+cluster-devel@lfdr.de>; Sat, 26 Mar 2022 01:22:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648254156;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=TaqVAZhHwYePXAlx8VX2R1s1xZM4U8mAR6j3BQ/H/U4=;
	b=Zb+wYyQmriRdbWU1UZTmTXJnGYcBYGbxAEplEoZ23NRV5jvTOJEHFLHG/CYO5E3df4spVW
	DlboWs7BK3Ntr1Q1Q7dmun2qecsWtDSWKmp8451nol+OlzYl0NijUtmUMDfCGIUsLNtoi/
	TWWWmkYwTZAp2jHGmlc21xg7CbmenlQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-A57OS_HnM92jNnZNfGrBow-1; Fri, 25 Mar 2022 20:22:33 -0400
X-MC-Unique: A57OS_HnM92jNnZNfGrBow-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF4EC811E75;
	Sat, 26 Mar 2022 00:22:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5309F40D0166;
	Sat, 26 Mar 2022 00:22:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 134C91940352;
	Sat, 26 Mar 2022 00:22:32 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8161B1940341 for <cluster-devel@listman.corp.redhat.com>;
 Sat, 26 Mar 2022 00:22:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5BC5E5E8A8A; Sat, 26 Mar 2022 00:22:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5807A5E8A85
 for <cluster-devel@redhat.com>; Sat, 26 Mar 2022 00:22:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F5431C04B43
 for <cluster-devel@redhat.com>; Sat, 26 Mar 2022 00:22:31 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-x1uEv49lNW-kEVo16nGxDA-1; Fri, 25 Mar 2022 20:22:29 -0400
X-MC-Unique: x1uEv49lNW-kEVo16nGxDA-1
Received: by mail-wm1-f71.google.com with SMTP id
 z16-20020a05600c0a1000b0038bebbd8548so5823931wmp.3
 for <cluster-devel@redhat.com>; Fri, 25 Mar 2022 17:22:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TaqVAZhHwYePXAlx8VX2R1s1xZM4U8mAR6j3BQ/H/U4=;
 b=JJDPQ0qcZozLvBeLxtLd9e7B+y6wa4CTunNXPPKjuDWGpmL+XVmT+Q4eocXT17CFsN
 LLsX625n4Hglw+DgwkKRFswBSqMYXinsL/usAZNy8I3RJC2xVtI8nLFNwN15cfpGD6/A
 dVWUn2EceybVXCD7Wa8KWQGhrc7ZiqVr9wkmFEB1c+TSIk1QpRC3m1l60FgZbxOONR5e
 t8ebiT2KnaJ4M4DCvFwuvpY4R3EeUxhaTbNSJJWjncxOFP5iaoDTEjlI14PU8x37dDaR
 DIK7OKvtFlATZQ64/JjaKtNg9KcziJY8P9QVxxXYr4yd7Xk3TgqOTBrwC0JFOKx8mmx/
 BzMw==
X-Gm-Message-State: AOAM531yFtK+C52mBq3Goscq0eHuTWqWcsOMT4k+AqH3BC/3h5d9TyPc
 bbe6FWeLEIx9a/G10FZWCrdCpAqIZpPSluBgJJrJnz3GgkRlKi/G0XAwp/gBEE/G11xCxk1I908
 GqmPLIJe9t0FzOoNSt29t2oKFD4/dfnKOYVWM1g==
X-Received: by 2002:a05:600c:154b:b0:38c:ca19:357d with SMTP id
 f11-20020a05600c154b00b0038cca19357dmr14517183wmg.51.1648254148608; 
 Fri, 25 Mar 2022 17:22:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7fv050p0+dCduoo9IIz2j41oDw3e9pP6zuYTcPmxsfP6cTyo6B3HDfnR7Fww5eAw5mEwIUQk3CAJR/7itvTQ=
X-Received: by 2002:a05:600c:154b:b0:38c:ca19:357d with SMTP id
 f11-20020a05600c154b00b0038cca19357dmr14517177wmg.51.1648254148422; Fri, 25
 Mar 2022 17:22:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220325143701.144731-1-agruenba@redhat.com>
 <20220326000337.GD8182@magnolia>
In-Reply-To: <20220326000337.GD8182@magnolia>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Sat, 26 Mar 2022 01:22:17 +0100
Message-ID: <CAHc6FU6ys6gQjqpT-p0b+9pRzQPGemvviAMJNgBvmXaM27k7jA@mail.gmail.com>
To: "Darrick J. Wong" <djwong@kernel.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: Re: [Cluster-devel] [GIT PULL] fs/iomap: Fix buffered write page
 prefaulting
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 LKML <linux-kernel@vger.kernel.org>, cluster-devel <cluster-devel@redhat.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 26, 2022 at 1:03 AM Darrick J. Wong <djwong@kernel.org> wrote:
> On Fri, Mar 25, 2022 at 03:37:01PM +0100, Andreas Gruenbacher wrote:
> > Hello Linus,
> >
> > please consider pulling the following fix, which I've forgotten to send
> > in the previous merge window.  I've only improved the patch description
> > since.
> >
> > Thank you very much,
> > Andreas
> >
> > The following changes since commit 42eb8fdac2fc5d62392dcfcf0253753e821a97b0:
> >
> >   Merge tag 'gfs2-v5.16-rc2-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2 (2021-11-17 15:55:07 -0800)
> >
> > are available in the Git repository at:
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git tags/write-page-prefaulting
> >
> > for you to fetch changes up to 631f871f071746789e9242e514ab0f49067fa97a:
> >
> >   fs/iomap: Fix buffered write page prefaulting (2022-03-25 15:14:03 +0100)
>
> When was this sent to fsdevel for public consideration?  The last time I
> saw any patches related to prefaulting in iomap was November.

On November 23, exact same patch:

https://lore.kernel.org/linux-fsdevel/20211123151812.361624-1-agruenba@redhat.com/

Andreas

