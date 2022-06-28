Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 885E255DD39
	for <lists+cluster-devel@lfdr.de>; Tue, 28 Jun 2022 15:27:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656422834;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=3WbsWEZ/mNVf4IIjW1g8i/pcRIWzNJLpjYPpewMPXV8=;
	b=hxXYEGiDFGByY/bdJ6e+VaDB8eeGQ+NRE7bY1M8sL/XCgvXitBsxBLGy+EpwNCcrnyQ2y3
	nNcUXAxfyZPv9zlaht1f3Gh/juEATxDACgiWw0uNb/hkjcEK0Ejtva87JhdJcZSvub3F84
	w9CESSP6/TFzzG1UcvA+zBS9wC1c3UA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-434-MiMm8D52Ni6ysaeg1CabHA-1; Tue, 28 Jun 2022 09:27:12 -0400
X-MC-Unique: MiMm8D52Ni6ysaeg1CabHA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 31AEE3C11725;
	Tue, 28 Jun 2022 13:27:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6ABB09D63;
	Tue, 28 Jun 2022 13:27:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E2C3C1947052;
	Tue, 28 Jun 2022 13:27:08 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C010E19466DF for <cluster-devel@listman.corp.redhat.com>;
 Tue, 28 Jun 2022 13:27:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AF8941678F; Tue, 28 Jun 2022 13:27:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AAE9C18EAB
 for <cluster-devel@redhat.com>; Tue, 28 Jun 2022 13:27:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8ECD73C11726
 for <cluster-devel@redhat.com>; Tue, 28 Jun 2022 13:27:07 +0000 (UTC)
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-fnDkTjahOjeqXlLVAz1ipA-1; Tue, 28 Jun 2022 09:27:05 -0400
X-MC-Unique: fnDkTjahOjeqXlLVAz1ipA-1
Received: by mail-qv1-f70.google.com with SMTP id
 b2-20020a0cb3c2000000b004703a79581dso12235936qvf.1
 for <cluster-devel@redhat.com>; Tue, 28 Jun 2022 06:27:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3WbsWEZ/mNVf4IIjW1g8i/pcRIWzNJLpjYPpewMPXV8=;
 b=xSAo1oIbpyaT17dyS/0i5q+CbJ7iX69G2vXnUFoz5zGzsHD2/OnlRQx3TiUw3Oc+Uf
 AQ8MVZPt/WQuEou4GG4h+FolLGTCv5XgytHed6bz4noFy+0QKQ97jXfJiqhQ2sfLxQC1
 dnQsDSRobMozXgsthEhYf+jGrSyweD6rHrRSk0Dwcmc9awdRdGDaroGHOy+UtAyMDvBv
 CTpT1mBmElTYtHZQXYCPY6xqIOuHmkdTiWmghLGWRCaaLNTpXPsInNVZpAOtZ06r5FAF
 lQKn/sQrvJLSIncr6JkOEVVsqEbtbAHdlwkCMNYr9uNJ6hvkJkOz0vTQWBShVP+NTdoq
 oqxA==
X-Gm-Message-State: AJIora/fWWWqnzPxWNaajyAsWO0JuHRQYPcR3rFvVTM23aaXNez44S8o
 TAHIg4eYQPDBi7OOPr0UXHGjSZ0Trf64229ZncXQa2vWW9TYWht8JRr8ReJ/hFrHX77TULdiR1s
 rthGTufgEDojLSls3NbbXXxidWv6nF26pfQ2Ghw==
X-Received: by 2002:a05:620a:4723:b0:6af:46a2:8531 with SMTP id
 bs35-20020a05620a472300b006af46a28531mr4202367qkb.177.1656422825513; 
 Tue, 28 Jun 2022 06:27:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tsWzlpf+KpXIDtDj3F+am63Ss3bkIPFmCxv2A+xlePARaj83XrP5hyjd8iOe/scwK2BxF/7To24Jkd7nVCV6s=
X-Received: by 2002:a05:620a:4723:b0:6af:46a2:8531 with SMTP id
 bs35-20020a05620a472300b006af46a28531mr4202346qkb.177.1656422825275; Tue, 28
 Jun 2022 06:27:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAK-6q+hd-L54cqOiFNuufS2_VF5XS0R8cjQL7es8921+2u3uwQ@mail.gmail.com>
 <20220627184232.tjfuzeir57l3h5ll@mail>
 <CAK-6q+haOfQD8_N6pEm80BTrUXwaj07ZBcXP-EBHftpTVEc1XQ@mail.gmail.com>
 <CAK-6q+g795MwPvUGxWXTE+s-TfJnbh2wf=Udb1k7r6ru-4FTMQ@mail.gmail.com>
 <20220628085821.kn3jjrviyprgai4w@mail>
In-Reply-To: <20220628085821.kn3jjrviyprgai4w@mail>
From: Alexander Aring <aahringo@redhat.com>
Date: Tue, 28 Jun 2022 09:26:54 -0400
Message-ID: <CAK-6q+h2syRtu1+7tv7ZQB98z62bn7vSeMX4b3uV6Oi+WxKsVA@mail.gmail.com>
To: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: Re: [Cluster-devel] sparse warnings related to kref_put_lock() and
 refcount_dec_and_lock()
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
Cc: linux-kernel@vger.kernel.org, cluster-devel <cluster-devel@redhat.com>,
 linux-sparse@vger.kernel.org, thunder.leizhen@huawei.com,
 jacob.e.keller@intel.com, akpm@linux-foundation.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Luc,

On Tue, Jun 28, 2022 at 4:58 AM Luc Van Oostenryck
<luc.vanoostenryck@gmail.com> wrote:
>
> On Mon, Jun 27, 2022 at 09:06:43PM -0400, Alexander Aring wrote:
> > >
> > > If we change the refcount code to _never_ calling unlock() for the
> > > specific lock, then all those foo_and_lock_bar() functions can be
> > > annotated with "__acquires()". This should also end in the same code?
> >
> > sorry, this will not work because of the first condition of "if
> > (refcount_dec_not_one(r))" which will never hold the lock if true...
> > that's what the optimization is all about. However, maybe somebody has
> > another idea...
>
> I would certainly not recommend this but ...
> if it's OK to cheat and lie then you can do:
> +       bool refcount_dec_and_lock(refcount_t *r, spinlock_t *lock) __acquires(lock);
> +
>         bool refcount_dec_and_lock(refcount_t *r, spinlock_t *lock)
>         {
> -               if (refcount_dec_not_one(r))
> -                       return false;
> +               if (refcount_dec_not_one(r)) {
> +                       __acquire(lock);
> +                       return false;
> +               }
>
>                 spin_lock(lock);
>                 if (!refcount_dec_and_test(r)) {
>                         spin_unlock(lock);
> +                       __acquire(lock);
>                         return false;
>                 }
>
>                 return true;
>         }
>
> In other word, pretend that the lock is always taken but ...
> 1) it's ugly
> 2) it's lying and can be confusing
> 3) now all the users of this function will have an imbalance problem
>    (but they probably already have one since refcount_dec_and_lock()
>     is not annotated).
>
> What is needed is some kind of annotation for conditional locks.
> I've tried a few time and in itself it was working but in most
> cases the usage pattern was so that there was a imbalance anyway.
>

may we can add something like __may_acquires() in the sense of
ignoring imbalances for the specific lock. This will not check
anything and probably ends in the same, but at least will stop
dropping warnings... my alternative would be to add a #ifdef
__CHECKER__ around my lock unlock().

Maybe just for now as no better option exists to validate such code
during compile time _at the moment_?

- Alex

