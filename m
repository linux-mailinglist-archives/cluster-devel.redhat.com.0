Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id B9E7338C02B
	for <lists+cluster-devel@lfdr.de>; Fri, 21 May 2021 09:01:33 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-gdkgFv9kMDeMOZF-6oQZmw-1; Fri, 21 May 2021 03:01:30 -0400
X-MC-Unique: gdkgFv9kMDeMOZF-6oQZmw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD209180FD72;
	Fri, 21 May 2021 07:01:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A69795D9C6;
	Fri, 21 May 2021 07:01:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 979CA1800BB4;
	Fri, 21 May 2021 07:01:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14L71Qd9000592 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 21 May 2021 03:01:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 927811649E2; Fri, 21 May 2021 07:01:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D7AF1649E5
	for <cluster-devel@redhat.com>; Fri, 21 May 2021 07:01:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D44BA185A79C
	for <cluster-devel@redhat.com>; Fri, 21 May 2021 07:01:22 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-259-BeshzE1uNjaO6HZeSdvr2g-1; Fri, 21 May 2021 03:01:19 -0400
X-MC-Unique: BeshzE1uNjaO6HZeSdvr2g-1
Received: by mail-wr1-f45.google.com with SMTP id z17so19909081wrq.7
	for <cluster-devel@redhat.com>; Fri, 21 May 2021 00:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=9SIh4qezErBShzcWnadZAbcLVeN36hf+/1c5wzsF+/0=;
	b=bMpN8Sg/epuTOq1trKmX76sgNjYyxXrXC5G69/lmV8Pgjb8y6pBFvorsvYgYUS6nRp
	DCi/Q3cZvx5dIesD17kf4GEAOlN0rpgTn2bx/ZD03vRtg0C10tafIIWtq1hI3ZjoizbU
	ofJyIOTkVn0JXC8zMfgnAuoanwqbX5BoaQJgZHzin5sDx0eQvdCkehY6QU622QjrNJnC
	yBjREFQtcqKQztSFjEdr3HG3qmrpDkZj7uceMnmF/TT0HABXRdnWV5PN3zse02bauap2
	uLgF82Z14N49ex3ALpT9wS4XJJ92wwfJaqjbBq5k06NCNCTr+fSZihn5cRHmia9fkTwU
	cFNg==
X-Gm-Message-State: AOAM530hVPygcWG64rzeZKb+i5kAFwrdm1GL24xrQFd4XrKznnCzHwmH
	bz7mC9II9JYBQTE11cjN0ja/2LBVNWOTSctK
X-Google-Smtp-Source: ABdhPJyOS8+jHk4co0JIgOdx73cazg37ZnCU71djedxm9H1qfZaJPVcK+b8IWxSBcOAGa3XxJKAT+g==
X-Received: by 2002:a5d:4946:: with SMTP id r6mr7871872wrs.123.1621580478801; 
	Fri, 21 May 2021 00:01:18 -0700 (PDT)
Received: from dell ([91.110.221.215]) by smtp.gmail.com with ESMTPSA id
	o129sm11645507wmo.22.2021.05.21.00.01.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 21 May 2021 00:01:18 -0700 (PDT)
Date: Fri, 21 May 2021 08:01:16 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20210521070116.GQ2549456@dell>
References: <20210520120043.3462759-1-lee.jones@linaro.org>
	<20210520120043.3462759-3-lee.jones@linaro.org>
	<CAHc6FU429=1Hzoghqo3=hqkSSmja3+ujna=mE_-Ro=KOMTPecg@mail.gmail.com>
	<20210521065822.GP2549456@dell>
MIME-Version: 1.0
In-Reply-To: <20210521065822.GP2549456@dell>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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

On Fri, 21 May 2021, Lee Jones wrote:

> On Fri, 21 May 2021, Andreas Gruenbacher wrote:
> 
> > On Thu, May 20, 2021 at 2:00 PM Lee Jones <lee.jones@linaro.org> wrote:
> > > Fixes the following W=1 kernel build warning(s):
> > >
> > >  fs/gfs2/glock.c:365: warning: Function parameter or member 'gl' not described in 'do_error'
> > >  fs/gfs2/glock.c:365: warning: Function parameter or member 'ret' not described in 'do_error'
> > >  fs/gfs2/glock.c:461: warning: Function parameter or member 'new_state' not described in 'state_change'
> > >  fs/gfs2/glock.c:1277: warning: Function parameter or member 'delay' not described in 'handle_callback'
> > >  fs/gfs2/glock.c:1277: warning: Function parameter or member 'remote' not described in 'handle_callback'
> > >  fs/gfs2/glock.c:1578: warning: Function parameter or member 'p' not described in 'nq_m_sync'
> > >  fs/gfs2/glock.c:1993: warning: Excess function parameter 'wait' description in 'gfs2_gl_hash_clear'
> > 
> > What's that? Those warnings don't exist in mainline, and the two
> > warnings we have in mainline are fixed in for-next:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git/commit/?h=for-next&id=75069590915f2
> 
> Thanks for the heads-up Andreas.
> 
> This is a rebased set that was authored last cycle.
> 
> It's great that someone has been through and fixed these already.
> 
> Tell me, is that just the case for this patch, or the whole set?

Oh, I see what's happened.

You squashed all of my patches across all of the different drivers
into a single commit for some reason.  Looks like Git didn't notice
and wilfully rebased the set, causing me to believe they hadn't been
accepted.

Dropped, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

