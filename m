Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E0A4B491D
	for <lists+cluster-devel@lfdr.de>; Mon, 14 Feb 2022 11:34:01 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-WIUcxeThN_OVkgZ_VU8Few-1; Mon, 14 Feb 2022 05:33:57 -0500
X-MC-Unique: WIUcxeThN_OVkgZ_VU8Few-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDB752F44;
	Mon, 14 Feb 2022 10:33:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D3CA5E4A5;
	Mon, 14 Feb 2022 10:33:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 573D71802FE9;
	Mon, 14 Feb 2022 10:33:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
	[10.11.54.8])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21EAXj8b025110 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 14 Feb 2022 05:33:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E9C84C50949; Mon, 14 Feb 2022 10:33:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E5FB5C50941
	for <cluster-devel@redhat.com>; Mon, 14 Feb 2022 10:33:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9F413C11A06
	for <cluster-devel@redhat.com>; Mon, 14 Feb 2022 10:33:44 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-266-zDSeMZ0FNf2WH6fnKRIgzA-1; Mon, 14 Feb 2022 05:33:42 -0500
X-MC-Unique: zDSeMZ0FNf2WH6fnKRIgzA-1
Received: by mail-wm1-f52.google.com with SMTP id
	x3-20020a05600c21c300b0037c01ad715bso7436088wmj.2
	for <cluster-devel@redhat.com>; Mon, 14 Feb 2022 02:33:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=Y2dQkZtEBm/fDqJ75Y4aAkTg3U+ZJI5VXSRDEIIFY/0=;
	b=r7ND6zzv7/e+1T6uTJD9moMr2v1ysnDHwM2HzDO7tR1r2J4p0W2rVi2b8sJoL/ES5W
	tfdDWCbCBwq16zE6eQ9MVks6SBNdJv35UePEs26RJOlmlWS4KcYOaAibiOxWOxrMRTQW
	erZGLUw+PM0TJkJCc26O42uhluroFAE1OcI09dueZJm9v0mjxMwuSkDD7qBL1LD0wSMj
	SG04nD3K+MJVN8S4viZBNFvJ9o9BGAto4hTI+GZyc0/2ahElDUsro+JDZDdPwum3slvv
	QFRNeuTnqAgMWvxBc44cKRntZe8UubbnUQYBK9hsqsMhByAhwk7SK1Tv+rjLJYj2Oxur
	GfHQ==
X-Gm-Message-State: AOAM5318HBk36z2bsRWMfg5EzTi0QCEXFW2E3EWaBJXC/okLtXPMh54d
	mDqJnpvqmVn9lkEAWHfSES0wMA==
X-Google-Smtp-Source: ABdhPJyQCmvkhGvcGJSPK0iuX2InSha335cVaRamyENYW1Z/K2WQPdYt8MDHDpiU9vBHs4mik5e1qA==
X-Received: by 2002:a05:600c:3552:: with SMTP id
	i18mr10585774wmq.90.1644834821019; 
	Mon, 14 Feb 2022 02:33:41 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
	[86.27.177.88]) by smtp.gmail.com with ESMTPSA id
	h17sm9479387wrx.58.2022.02.14.02.33.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 14 Feb 2022 02:33:40 -0800 (PST)
Date: Mon, 14 Feb 2022 10:33:38 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <YgowAl01rq5A8Sil@google.com>
References: <20220209085243.3136536-1-lee.jones@linaro.org>
	<20220210045911.GF8338@magnolia> <YgTl2Lm9Vk50WNSj@google.com>
	<YgZ0lyr91jw6JaHg@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <YgZ0lyr91jw6JaHg@casper.infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Damien Le Moal <damien.lemoal@wdc.com>,
	linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
	"Darrick J . Wong" <darrick.wong@oracle.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	linux-kernel@vger.kernel.org, Stable <stable@vger.kernel.org>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Ritesh Harjani <riteshh@linux.ibm.com>,
	Johannes Thumshirn <jth@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Goldwyn Rodrigues <rgoldwyn@suse.com>,
	syzbot+0ed9f769264276638893@syzkaller.appspotmail.com
Subject: Re: [Cluster-devel] [PATCH 1/1] Revert "iomap: fall back to
 buffered writes for invalidation failures"
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Let's attempt to seek beyond the mud slinging, swearing and the whiny
amateur dramatics for just a brief moment and concentrate solely on
the technicals please.

On Fri, 11 Feb 2022, Matthew Wilcox wrote:
> On Thu, Feb 10, 2022 at 10:15:52AM +0000, Lee Jones wrote:
> > On Wed, 09 Feb 2022, Darrick J. Wong wrote:
> > 
> > > On Wed, Feb 09, 2022 at 08:52:43AM +0000, Lee Jones wrote:
> > > > This reverts commit 60263d5889e6dc5987dc51b801be4955ff2e4aa7.
> > > > 
> > > > Reverting since this commit opens a potential avenue for abuse.
> > > 
> > > What kind of abuse?  Did you conclude there's an avenue solely because
> > > some combination of userspace rigging produced a BUG warning?  Or is
> > > this a real problem that someone found?
> > 
> > Genuine question: Is the ability for userspace to crash the kernel
> > not enough to cause concern?  I would have thought that we'd want to
> > prevent this.
> 
> The kernel doesn't crash.  It's a BUG().  That means it kills the
> task which caused the BUG().  If you've specified that the kernel should
> crash on seeing a BUG(), well, you made that decision, and you get to
> live with the consequences.

BUG() calls are architecture specific.  If no override is provided,
the default appears to panic ("crash") the kernel:

 /*
  * Don't use BUG() or BUG_ON() unless there's really no way out; one
  * example might be detecting data structure corruption in the middle
  * of an operation that can't be backed out of.  If the (sub)system
  * can somehow continue operating, perhaps with reduced functionality,
  * it's probably not BUG-worthy.
  *
  * If you're tempted to BUG(), think again:  is completely giving up
  * really the *only* solution?  There are usually better options, where
  * users don't need to reboot ASAP and can mostly shut down cleanly.
  */
 #ifndef HAVE_ARCH_BUG
 #define BUG() do { \
         printk("BUG: failure at %s:%d/%s()!\n", __FILE__, __LINE__, __func__); \
         barrier_before_unreachable(); \
         panic("BUG!"); \
 } while (0)
 #endif

The kernel I tested with panics and reboots:

 Kernel panic - not syncing: Fatal exception

Here are the BUG related kernel configs I have set:

 CONFIG_BUG=y                          
 CONFIG_GENERIC_BUG=y                  
 CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
 # CONFIG_INPUT_EVBUG is not set       
 CONFIG_BUG_ON_DATA_CORRUPTION=y       

Not seeing a "CONFIG_PANIC_ON_BUG" equivalent.  What is missing?

Unless of course you mean disabling BUG support entirely.  In which
case, this is strongly advised against in the help section and I'm not
sure of many development or production kernels that do this.

 config BUG
        bool "BUG() support" if EXPERT
        default y
        help
          Disabling this option eliminates support for BUG and WARN, reducing
          the size of your kernel image and potentially quietly ignoring
          numerous fatal conditions. You should only consider disabling this
          option for embedded systems with no facilities for reporting errors.
          Just say Y.

I've always been under the impression that a BUG() call should never
be triggerable from userspace.  However, I'm always happy to be
incorrect and subsequently reeducated.

In other words ...

Is this a valid issue that you want me to report (in a different way):

> Start again, write a good bug report in a new thread.

Or is this expected behaviour and therefore not a concern:

> > > The BUG report came from page_buffers failing to find any buffer heads
> > > attached to the page.
> > 
> > > Yeah, don't care.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

