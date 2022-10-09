Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 276515F894E
	for <lists+cluster-devel@lfdr.de>; Sun,  9 Oct 2022 06:03:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665288225;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=lGcANlxwwAoMV2yYuqmWVwlrAW36ZFrUJRQgUMMRe4U=;
	b=AJp5+TWzcPxrz3//YgMy0VTbiKZH3Xgxo1FWaLw/u48oIILg1761s/m+pac72jkjMKdRS5
	h+6Hkf0gHsedel/zBv/+z+OkcQnbDqoUUjMnQJTEuiVhezSe6SKhX9fADyxidb0onHyUz8
	oxTuNLai9PFZNlt+TAj1pJ/qb+gqbBc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-owA_d-SYPZ6vpNjgnOxHZQ-1; Sun, 09 Oct 2022 00:03:39 -0400
X-MC-Unique: owA_d-SYPZ6vpNjgnOxHZQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F356185A78F;
	Sun,  9 Oct 2022 04:03:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 33ACD53592D;
	Sun,  9 Oct 2022 04:03:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A068C1946595;
	Sun,  9 Oct 2022 04:03:35 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 207F71946586 for <cluster-devel@listman.corp.redhat.com>;
 Sun,  9 Oct 2022 04:03:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B861B215CDB7; Sun,  9 Oct 2022 04:03:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B1AC62166B4D
 for <cluster-devel@redhat.com>; Sun,  9 Oct 2022 04:03:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 928E295D681
 for <cluster-devel@redhat.com>; Sun,  9 Oct 2022 04:03:34 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-589-9eG2MO7pMaiIBqGsD2EBEQ-1; Sun, 09 Oct 2022 00:03:30 -0400
X-MC-Unique: 9eG2MO7pMaiIBqGsD2EBEQ-1
Received: by mail-pj1-f42.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so10455738pjq.3
 for <cluster-devel@redhat.com>; Sat, 08 Oct 2022 21:03:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lGcANlxwwAoMV2yYuqmWVwlrAW36ZFrUJRQgUMMRe4U=;
 b=iBXEBdQk6NhtXXTk8QytiG9Vmqhh5gaFwzFC9HIVttFMBdaEGoaZwURf/vnkoexIBp
 hsxX3FjKLiEbjkGbDFExlGbvpQuIYg652T/Ghpx/KzY9ih9ITg3bG0uERWVsEDK7x9AD
 cUrl5c65LPRD2ud2iqZK5t6juaHM4JkMAi+4Zmkc2qKvzYkuV5ci0ge3rORb6HqD/NtV
 ch4QTp7OeY81DZceTsrb0oXA+lxL+K4nBvqKaLu0pH747eBB9lcvxeReNRUnbIPj1UnO
 RCuDkE+h5oEv2xu4yO5XxxgBETP1tX3Aad8oYImxB4MlL1QsCnlDW/SNDrObzj2DJM+V
 zzyw==
X-Gm-Message-State: ACrzQf0+mTO1vXolZQv0H4f4BlohfTf/vBB9reoqg18RCsyqW3+ezQQF
 1WORxZ3L+/aFg/9NQjoBze1pgA==
X-Google-Smtp-Source: AMsMyM4wxlo6Eqvw98xHCVgZjF9QkQXjx7TiytIor/82u/00GrEhO16CVKVF/xw7v1ToUcMCP8llZw==
X-Received: by 2002:a17:902:b20a:b0:178:6f5b:f903 with SMTP id
 t10-20020a170902b20a00b001786f5bf903mr13070468plr.39.1665288209694; 
 Sat, 08 Oct 2022 21:03:29 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 x6-20020a628606000000b005629b6a8b53sm4384256pfd.15.2022.10.08.21.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Oct 2022 21:03:29 -0700 (PDT)
Date: Sat, 8 Oct 2022 21:03:28 -0700
From: Kees Cook <keescook@chromium.org>
To: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
Message-ID: <202210082044.51106145BD@keescook>
References: <Y0IFEUjwXGZFf7bB@mail.google.com>
 <378C6BDE-0A68-4938-86CD-495BD5F35BE6@chromium.org>
 <Y0IsXXYnS4DnWkMW@mail.google.com>
MIME-Version: 1.0
In-Reply-To: <Y0IsXXYnS4DnWkMW@mail.google.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Cluster-devel] [PATCH v2][next] dlm: Replace one-element array
 with flexible-array member
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
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 09, 2022 at 03:05:17PM +1300, Paulo Miguel Almeida wrote:
> On Sat, Oct 08, 2022 at 05:18:35PM -0700, Kees Cook wrote:
> > This is allocating 1 more byte than before, since the struct size didn't change. But this has always allocated too much space, due to the struct padding. For a "no binary changes" patch, the above "+ 1" needs to be left off.
> 
> That's true. I agree that leaving "+ 1" would work and produce a
> no-binary-changes patch due to the existing padding that the structure
> has. OTOH, I thought that relying on that space could bite us in the
> future if anyone tweaks the struct again...so my reaction was to ensure 
> that the NUL-terminator space was always guaranteed to be there.
> Hence, the change on c693 (objdump above).
> 
> What do you think? Should we keep or leave the above
> "+ 1" after the rationale above?

I think it depends on what's expected from this allocation. Christine or
David, can you speak to this?

> > I would expect the correct allocation size to be:
> > offsetof(typeof(*ls), ls_name) + namelen
> 
> Fair point, I will make this change.

Well, only do that if we don't depend on the padding nor a trailing
%NUL. :)

> > Question, though: is ls_name _expected_ to be %NUL terminated
> 
> Yes, it is. I tracked down ls_name's utilisations and it is passed down to 
> a bunch of routines that expects it to be NUL-terminated such as
> snprintf and vsnprintf.

Agreed: I see the string functions it gets passed to. So, then the next
question I have is does "namelen" take into account the %NUL, and is
"name" %NUL terminated? Those answers appear to be "no" and "yes",
respectively:

static int new_lockspace(const char *name, ...)
{
	...
        int namelen = strlen(name);


The comparisons for ls->ls_namelen are all done without the %NUL count:

                if (ls->ls_namelen != namelen)
                        continue;
                if (memcmp(ls->ls_name, name, namelen))
                        continue;

> >, and was the prior 3 bytes of extra allocation accidentally required?
> > 
> 
> I am assuming that you are refering to ls_namelen in the struct dlm_ls
> (please correct me if this isn't what you meant).

No, I meant ls_name (the pahole output shows the trailing 3 bytes of
padding before. And with your patch it becomes 4 bytes of trailing
padding.

So I think this is "accidentally correct", since it's so carefully using
memcmp() and not strcmp().

Given the existing padding on the structure, through, it likely needs
to keep a certain amount of minimum padding.

original size was actually this, so you could use this for the new
calculation to get the same values as before:

	offsetof(typeof(*ls), ls_name) + 4 + namelen;

In reality, it may be possible to do this to get exactly what is needed,
but no less than the struct itself:

	max(offsetof(typeof(*ls), ls_name) + 1 + namelen, sizeof(*ls));

-Kees

-- 
Kees Cook

