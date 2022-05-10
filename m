Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E0ECC522334
	for <lists+cluster-devel@lfdr.de>; Tue, 10 May 2022 19:56:08 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-0EfNJR1cPxS_WVTmdPLCkQ-1; Tue, 10 May 2022 13:56:05 -0400
X-MC-Unique: 0EfNJR1cPxS_WVTmdPLCkQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13E1E185A794;
	Tue, 10 May 2022 17:56:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7B771414A7E9;
	Tue, 10 May 2022 17:56:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4F6D91947078;
	Tue, 10 May 2022 17:56:02 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DBEA01947070 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 10 May 2022 17:56:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B78D4402D8F; Tue, 10 May 2022 17:56:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B2FE9416369
 for <cluster-devel@redhat.com>; Tue, 10 May 2022 17:56:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99F991010360
 for <cluster-devel@redhat.com>; Tue, 10 May 2022 17:56:00 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-Hxgm9mMhNeiTcI6msVOuhw-1; Tue, 10 May 2022 13:55:59 -0400
X-MC-Unique: Hxgm9mMhNeiTcI6msVOuhw-1
Received: by mail-pg1-f171.google.com with SMTP id r192so11064301pgr.6
 for <cluster-devel@redhat.com>; Tue, 10 May 2022 10:55:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=s6/hlByeT2qmMcSxzfXgIlnA/5v0PpA7ktjUjtSdcsI=;
 b=RhjZvCgDKoD0YM4Offrg9hHmvuaMbLaAd+crnM/INqpaw5ZKYT630a/m6etBSrJfD+
 c2bglcFOMwoGlKF9cDAlSntu+VkZHojNK0mw9MZMDBDeRkd9NLfkl3F59Jfvf9Mz4ZYk
 nsQmAU0irg5TIAtIUCVoCtmMzzJHgDEU98BX4N2GVnQMpbkvA4X/C/sx4r/xBlznxdsR
 Ka8KIfKHNoHhd2aqAEtdCcaZCFk/0Imj9uQbi3sGVcbFRHkRnOxv6vT8Yu+EGVQc5qWv
 eHIHDxPzvJ5zonhui2Jg/CkqkCLaq6PC5uGcYkBccqmX+eZUxy0KKik2bD+RU1KFoDpW
 RL8g==
X-Gm-Message-State: AOAM531TkgWiqdbuvHxyHmAoI6ni6Djr+eFj4s2pVsD0H5n2R6x4Gr23
 h4S6B6oOspcg27ZNFmDRsNQfkfWHWjdj/w==
X-Google-Smtp-Source: ABdhPJyim9d8DrEoKjYAbIwvDlhB/YeC8sxVLzUKhX0/QuntXvui94aB188iHyhn73ZvXnr/W/RxaQ==
X-Received: by 2002:a65:6e47:0:b0:3c6:7d47:ddc8 with SMTP id
 be7-20020a656e47000000b003c67d47ddc8mr13062956pgb.157.1652205358327; 
 Tue, 10 May 2022 10:55:58 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 c80-20020a621c53000000b0050dc7628132sm11274436pfc.12.2022.05.10.10.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 10:55:58 -0700 (PDT)
Date: Tue, 10 May 2022 10:55:57 -0700
From: Kees Cook <keescook@chromium.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <202205101055.171D1A88@keescook>
References: <20220508100630.2642320-1-keescook@chromium.org>
 <YnoQmuPgK9c5V8ZC@infradead.org>
 <CAHc6FU5VfS9yNe0yH_sfOt04rvii6T_NMq7kp+32HZa5XQDtEA@mail.gmail.com>
 <202205100851.663310B@keescook>
 <CAHc6FU4hRBHUJOCF33z=dzOJszYCpiZ=wikdyXZ1u25hGQ00ng@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHc6FU4hRBHUJOCF33z=dzOJszYCpiZ=wikdyXZ1u25hGQ00ng@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [Cluster-devel] [PATCH] gfs2: Use container_of() for
 gfs2_glock(aspace)
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
Cc: Nathan Chancellor <nathan@kernel.org>,
 cluster-devel <cluster-devel@redhat.com>, kernel test robot <lkp@intel.com>,
 Tom Rix <trix@redhat.com>, Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>, Bill Wendling <morbo@google.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 10, 2022 at 06:16:30PM +0200, Andreas Gruenbacher wrote:
> Kees,
> 
> On Tue, May 10, 2022 at 5:51 PM Kees Cook <keescook@chromium.org> wrote:
> > Thanks! So I should leave this with you to arrange, or should I send an
> > updated patch?
> 
> are you happy with this?
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git/commit/?id=833ab609b94f6
> 

Sure; looks great! You should credit yourself with the code changes,
maybe, with:

Co-developed-by: Andreas Gruenbacher <agruenba@redhat.com>

Thanks!

-- 
Kees Cook

