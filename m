Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B7055BCDB
	for <lists+cluster-devel@lfdr.de>; Tue, 28 Jun 2022 03:07:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656378423;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=qd874xtCALLLoZTYnK0UQbFRAzSITPNiJ0IyPu+wf6I=;
	b=NdL6dWELeS3PqGFkWmCeifkVCOi+JVow0VYdO+tdHN9yOa90V7AVb2t+p4Xcr0R4So5jXw
	1PAOAiYv8gVu5E0dXJGNE/+Fx+ih8JaSbKmlbT39cJ6IaRMUWX+3OI/Ozkbk5D6vGlxuq2
	jidDmjb8SdwHaH42caweCaikvPdqP/0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-542-bXY3SCBcOOSvjJzieX8pqA-1; Mon, 27 Jun 2022 21:06:59 -0400
X-MC-Unique: bXY3SCBcOOSvjJzieX8pqA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1B74101A588;
	Tue, 28 Jun 2022 01:06:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BF0279D54;
	Tue, 28 Jun 2022 01:06:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9C056194704E;
	Tue, 28 Jun 2022 01:06:58 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3C51F19466DF for <cluster-devel@listman.corp.redhat.com>;
 Tue, 28 Jun 2022 01:06:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 17D8C2166B2A; Tue, 28 Jun 2022 01:06:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 138F82166B29
 for <cluster-devel@redhat.com>; Tue, 28 Jun 2022 01:06:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EBB7B811E7A
 for <cluster-devel@redhat.com>; Tue, 28 Jun 2022 01:06:56 +0000 (UTC)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-209-JdGkXfMhP0Cq5MC2t4cNXg-1; Mon, 27 Jun 2022 21:06:55 -0400
X-MC-Unique: JdGkXfMhP0Cq5MC2t4cNXg-1
Received: by mail-qk1-f198.google.com with SMTP id
 l189-20020a37bbc6000000b006af2596c5e8so4980563qkf.14
 for <cluster-devel@redhat.com>; Mon, 27 Jun 2022 18:06:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qd874xtCALLLoZTYnK0UQbFRAzSITPNiJ0IyPu+wf6I=;
 b=APM67Q5IiAnxwyjP5PNbSDbnupB6ESAiukMhnqRlWAQJ4eExE88daHe+/qb4MVPI/i
 FhTf0JR3RUhMa83Z2wAIillUydHixt4VIgU8plLT8VVmhamY0hEdOCM7dcUqBK1BqkPA
 +QfsLSWU7Cift5++T4F+HSHf/Yv/LbuoGT9xZ+if2FG7qAbZoA22GfDywLvJQwsMLzWF
 rKUTAa0Js7FDbM81il3chy5oMJhvl6+c2R9RTuzIiJiAzaYL2g4C4+BCzmhQQoUIxHD7
 o9jhTLMcjVlPuYREegB3fC9u65QNRQf5s9lrX+zWHrVCjXZGsZPCGcdvyLBld00j6eqI
 R4RA==
X-Gm-Message-State: AJIora/TR9eyOigcBl9fNUDC4MldViWkKpHZjedaZFKl+0+UYuO1/Xih
 w6NJWSoVDxoP5Q5TUS8duVhcXIsnGDeGNBX7G+C7vI5WVb3M3rA07Wj9Xd/HXnwI/E0w1Is8eNt
 3IQnxLqf5GKcTPam1erwlcolsrdy4wXTEmgro6w==
X-Received: by 2002:a37:67c9:0:b0:6af:a24:df4b with SMTP id
 b192-20020a3767c9000000b006af0a24df4bmr10208170qkc.691.1656378415004; 
 Mon, 27 Jun 2022 18:06:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sM+DE05HKnqCKiuiPXvpVvEidKjNa59r4LZdriDsOcKKbeLhGbXgYemJcg7o/G2oObtWkqNrJIxr2o+yhihfo=
X-Received: by 2002:a37:67c9:0:b0:6af:a24:df4b with SMTP id
 b192-20020a3767c9000000b006af0a24df4bmr10208157qkc.691.1656378414786; Mon, 27
 Jun 2022 18:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAK-6q+hd-L54cqOiFNuufS2_VF5XS0R8cjQL7es8921+2u3uwQ@mail.gmail.com>
 <20220627184232.tjfuzeir57l3h5ll@mail>
 <CAK-6q+haOfQD8_N6pEm80BTrUXwaj07ZBcXP-EBHftpTVEc1XQ@mail.gmail.com>
In-Reply-To: <CAK-6q+haOfQD8_N6pEm80BTrUXwaj07ZBcXP-EBHftpTVEc1XQ@mail.gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Mon, 27 Jun 2022 21:06:43 -0400
Message-ID: <CAK-6q+g795MwPvUGxWXTE+s-TfJnbh2wf=Udb1k7r6ru-4FTMQ@mail.gmail.com>
To: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, jacob.e.keller@intel.com,
 akpm@linux-foundation.org, thunder.leizhen@huawei.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
Cc: cluster-devel <cluster-devel@redhat.com>, linux-sparse@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, Jun 27, 2022 at 8:56 PM Alexander Aring <aahringo@redhat.com> wrote:
>
> Hi Luc and others,
>
> On Mon, Jun 27, 2022 at 2:42 PM Luc Van Oostenryck
> <luc.vanoostenryck@gmail.com> wrote:
> >
> > On Mon, Jun 27, 2022 at 11:15:17AM -0400, Alexander Aring wrote:
> > > Hi,
> > >
> > > I recently converted to use kref_put_lock() in fs/dlm subsystem and
> > > now I get the following warning in sparse:
> > >
> > > warning: context imbalance in 'put_rsb' - unexpected unlock
> > >
> > > It seems sparse is not able to detect that there is a conditional
> > > requirement that the lock passed to kref_put_lock() (or also
> > > refcount_dec_and_lock()) is locked or not. I evaluate the return value
> > > to check if kref_put_lock() helds the lock and unlock it then. The
> > > idea is that the lock needs only to be held when the refcount is going
> > > to be zero.
> > >
> > > It seems other users unlock the lock at the release callback of
> > > kref_put_lock() and annotate the callback with "__releases()" which
> > > seems to work to avoid the sparse warning. However this works if you
> > > don't have additional stack pointers which you need to pass to the
> > > release callback.
> > >
> > > My question would be is this a known problem and a recommended way to
> > > avoid this sparse warning (maybe just for now)?
> >
> > Hi,
> >
> > I suppose that your case here can be simplified into something like:
> >
> >         if (some_condition)
> >                 take(some_lock);
> >
> >         do_stuff();
> >
> >         if (some_condition)
> >                 release(some_lock);
> >
> > Sparse issues the 'context imbalance' warning because, a priori,
> > it can't exclude that some execution will takes the lock and not
> > releases it (or the opposite). In some case, when do_stuff() is
> > very simple, sparse can see that everything is OK, but generally
> > it won't (some whole kernel analysis but the general case is
> > undecidable anyway).
> >
> > The recommended way would be to write things rather like this:
> >
> >         if (some_condition) {
> >                 take(some_lock);
> >                 do_stuff();
> >                 release(some_lock);
> >         } else {
> >                 do_stuff();
> >         }
> >
>
> This is not an alternative for me because the lock needs to hold
> during the "some_condition". (More background is that we dealing with
> data structures here and cannot allow a get() from this data
> structures during "some_condition", the lock is preventing this)
> It is the refcount code which causes trouble here [0] and I think the
> refcount code should never call the unlock() procedure in any
> condition and leave it to the caller to call unlock() in any case.
>
> I to'ed (hope to get more attention to this) more people related to
> lib/refcount.c implementation (provided by get_maintainers.pl -f).
>
> >
> > The __acquires() and __releases() annotations are needed for sparse
> > to know that the annotated function always take or always release
> > some lock but won't handle conditional locks.
> >
>
> If we change the refcount code to _never_ calling unlock() for the
> specific lock, then all those foo_and_lock_bar() functions can be
> annotated with "__acquires()". This should also end in the same code?

sorry, this will not work because of the first condition of "if
(refcount_dec_not_one(r))" which will never hold the lock if true...
that's what the optimization is all about. However, maybe somebody has
another idea...

- Alex

