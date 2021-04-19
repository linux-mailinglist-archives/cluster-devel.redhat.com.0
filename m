Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7C353363C71
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Apr 2021 09:27:04 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-n67fURCLPv2OSuIuG3Rxdg-1; Mon, 19 Apr 2021 03:27:02 -0400
X-MC-Unique: n67fURCLPv2OSuIuG3Rxdg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F370579EC0;
	Mon, 19 Apr 2021 07:26:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 67FA45C6DE;
	Mon, 19 Apr 2021 07:26:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E690F44A57;
	Mon, 19 Apr 2021 07:26:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13J7QpVI017479 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Apr 2021 03:26:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AB3102063570; Mon, 19 Apr 2021 07:26:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A638A2063561
	for <cluster-devel@redhat.com>; Mon, 19 Apr 2021 07:26:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA77C185A79C
	for <cluster-devel@redhat.com>; Mon, 19 Apr 2021 07:26:48 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-425-dBf6MQbfNQGzAB2eEu_rxQ-1; Mon, 19 Apr 2021 03:26:45 -0400
X-MC-Unique: dBf6MQbfNQGzAB2eEu_rxQ-1
Received: by mail-wr1-f48.google.com with SMTP id m9so20075536wrx.3
	for <cluster-devel@redhat.com>; Mon, 19 Apr 2021 00:26:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=2BaP8TWvorcR2IXXU9ccES/WVlUvsF3IFm5ixOqLO3o=;
	b=InMMzmn+T45yhuGQfP/AnhKiewfGXr38TBOqh3uKmcbhoaEGclCP41prJNeub0Ifnv
	L0+fLuFZBo8mhpKk6dt1EBQdaoW3Fnqqx7dztKP2JYyBeaoNfOZwtBsRaCwN6cTEIR5L
	+oe3idVeqNT6wU1soGOcgY3pEdg29VxrLdkIQtER3UWHFTDV8vXViy6UCQPcldfTNvY9
	zN4azl/pIUGi8V8akY55cGyzi2c/OUouI8wrQsFAWI3X8LsSCJrUUVooYI1mBU8CXW/B
	1+VnL8Cb2IZrJJrDRJnXoX7zOtLvZ0oUvB0FCbQGb+BJbdOKctTyMTzgfSbpld9nEzWq
	ggcA==
X-Gm-Message-State: AOAM532sb7Jq6wYJ+5lCnjmhXsXpyr+LeHXx2jtGtERh4fOEY2lRBaFk
	WNtIR10bUu+mCUDAL+yW/duQvA==
X-Google-Smtp-Source: ABdhPJxiB6PCNMvbcsVLql5kAlV60E/PKSrqhL/E5Cjb7JzKzneD+W19Bc+ZeApiSVEfX0mGnHTkGQ==
X-Received: by 2002:a5d:5711:: with SMTP id a17mr12824723wrv.342.1618817204632;
	Mon, 19 Apr 2021 00:26:44 -0700 (PDT)
Received: from dell ([91.110.221.215]) by smtp.gmail.com with ESMTPSA id
	s64sm18910767wmf.2.2021.04.19.00.26.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 19 Apr 2021 00:26:44 -0700 (PDT)
Date: Mon, 19 Apr 2021 08:26:42 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Tyler Hicks <code@tyhicks.com>
Message-ID: <20210419072642.GD4869@dell>
References: <20210330164458.1625478-1-lee.jones@linaro.org>
	<20210419050926.GB405651@elm>
MIME-Version: 1.0
In-Reply-To: <20210419050926.GB405651@elm>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: David Howells <dhowells@redhat.com>, Michal Hocko <mhocko@suse.com>,
	Eric Biggers <ebiggers@google.com>, ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, James Morris <jamorris@linux.microsoft.com>,
	Tycho Andersen <tycho@tycho.pizza>, cluster-devel@redhat.com,
	"Michael A. Halcrow" <mahalcro@us.ibm.com>,
	"Trevor S. Highland" <trevor.highland@gmail.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Waiman Long <longman@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Michael C. Thompsion" <mcthomps@us.ibm.com>,
	Christian Brauner <christian.brauner@ubuntu.com>,
	"Michael A. Halcrow" <mhalcrow@us.ibm.com>
Subject: Re: [Cluster-devel] [PATCH 00/31] Rid W=1 warnings from GFS2 and
	EncryptFS
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

On Mon, 19 Apr 2021, Tyler Hicks wrote:

> On 2021-03-30 17:44:27, Lee Jones wrote:
> > This set is part of a larger effort attempting to clean-up W=1
> > kernel builds, which are currently overwhelmingly riddled with
> > niggly little warnings.
> > 
> > There is more to do in filesystems.  Another set will follow.
> > 
> > Lee Jones (31):
> ...
> >   fs: ecryptfs: read_write: File headers do not make good candidates for
> >     kernel-doc
> >   fs: ecryptfs: debug: Demote a couple of kernel-doc abuses
> >   fs: ecryptfs: dentry: File headers are not good candidates for
> >     kernel-doc
> >   fs: ecryptfs: kthread: Demote file header and provide description for
> >     'cred'
> >   fs: ecryptfs: file: Demote kernel-doc abuses
> >   fs: ecryptfs: super: Fix formatting, naming and kernel-doc abuses
> >   fs: ecryptfs: messaging: Add missing param descriptions and demote
> >     abuses
> >   fs: ecryptfs: main: Demote a bunch of non-conformant kernel-doc
> >     headers
> >   fs: ecryptfs: miscdev: File headers are not good kernel-doc candidates
> >   fs: ecryptfs: crypto: Supply some missing param descriptions and
> >     demote abuses
> >   fs: ecryptfs: mmap: Help out one function header and demote other
> >     abuses
> >   fs: ecryptfs: inode: Help out nearly-there header and demote
> >     non-conformant ones
> >   fs: ecryptfs: keystore: Fix some kernel-doc issues and demote
> >     non-conformant headers
> 
> I've applied the eCryptfs fixes to the next branch of
> tyhicks/ecryptfs.git. Thanks for the clean-up!

Thanks Tyler, much appreciated.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

