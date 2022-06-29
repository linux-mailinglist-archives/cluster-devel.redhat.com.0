Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0EF5604AF
	for <lists+cluster-devel@lfdr.de>; Wed, 29 Jun 2022 17:33:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656516802;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=V7S0nWCPZZOEGbD8N2JmBW7Bz7rcl+xCGtpBNVP7MTQ=;
	b=MrW4Em7UkCgPVM+qKXoGM4iM05V4C8MZcKiJCUxSOOPytlBpJhQnwOWhS+l/3raHUV5TM5
	IXR9LOe5H2q7/LiEOKlHoB7suEge911yazGhztWIE8ErKQ2P62cDYWLu0071lRvwfXJd9x
	rzAo9tlx7IQlobIHDDChtb2e+CANw/g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-_5eilmXwM3O8yZcaoNTZNQ-1; Wed, 29 Jun 2022 11:33:19 -0400
X-MC-Unique: _5eilmXwM3O8yZcaoNTZNQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 21F45185A7A4;
	Wed, 29 Jun 2022 15:33:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 887F440F06D;
	Wed, 29 Jun 2022 15:33:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4040E194705E;
	Wed, 29 Jun 2022 15:33:13 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id ACB1E1947058 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 29 Jun 2022 14:43:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8B5FD112131B; Wed, 29 Jun 2022 14:43:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8783B1121314
 for <cluster-devel@redhat.com>; Wed, 29 Jun 2022 14:43:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C2573C025B2
 for <cluster-devel@redhat.com>; Wed, 29 Jun 2022 14:43:03 +0000 (UTC)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-9oKDd9aOO_emEinK7dfhbw-1; Wed, 29 Jun 2022 10:43:02 -0400
X-MC-Unique: 9oKDd9aOO_emEinK7dfhbw-1
Received: by mail-qk1-f197.google.com with SMTP id
 m15-20020a05620a290f00b006a74cf760b2so16638233qkp.20
 for <cluster-devel@redhat.com>; Wed, 29 Jun 2022 07:43:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V7S0nWCPZZOEGbD8N2JmBW7Bz7rcl+xCGtpBNVP7MTQ=;
 b=6BIsz4GXox4b1KdxNTT4TGHWF04Pv9rIt/9i1BAZ742bE9mc7mCiECFV4STyZdIJQF
 0I1DgLmVsvmVI0472yi+/AvK5AujaZ+qqx8OOFjdGIgt2KbMJufEWTIWpzBoGSZXPWag
 9GFZN6nHUf1oixvqcXsRfYwBmeb5FXPmqvWRxGd/TW3Gn11ANk5riD+qlWelmXh+rfpp
 5dAsu/2WJh5AiK5Ot0zcyPHbbKnFIEDT7qYrkjlXbY1oMRE2kDXImFVm/TmQfrrknwQm
 YVg/sb1nJ0xGYiO+3ZodNOvAOysGTXgjHwlQU1jSErn+2f5J7VjsbKR/Kg4MR6x5lx+t
 9p1Q==
X-Gm-Message-State: AJIora/5tjGnBLxyXM1qk/zfinrAIQw7SsE0xq1X4LdaNCHDppEWIk3o
 3ygvCcV/BniLWw0XsBbZtv0461M/iNSucNn5VlvksiEiGT/jAmAy4xjqVusImDMiomdoNElzjyL
 DAG56Wvn+T/cC849eKfHey5rx2dAonq8gUyOFog==
X-Received: by 2002:a05:622a:90a:b0:31b:899:3070 with SMTP id
 bx10-20020a05622a090a00b0031b08993070mr2755601qtb.470.1656513781462; 
 Wed, 29 Jun 2022 07:43:01 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1snXWlAR3sgWdAIaN3DlBIW0o4Fn6o5OCZioO1HkvOSAAI/43K9/YCye+hVbbMtLzZX4DAPjMyCEshh3UDDr/g=
X-Received: by 2002:a05:622a:90a:b0:31b:899:3070 with SMTP id
 bx10-20020a05622a090a00b0031b08993070mr2755577qtb.470.1656513781205; Wed, 29
 Jun 2022 07:43:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAK-6q+hd-L54cqOiFNuufS2_VF5XS0R8cjQL7es8921+2u3uwQ@mail.gmail.com>
 <20220627184232.tjfuzeir57l3h5ll@mail>
 <CAK-6q+haOfQD8_N6pEm80BTrUXwaj07ZBcXP-EBHftpTVEc1XQ@mail.gmail.com>
 <CAK-6q+g795MwPvUGxWXTE+s-TfJnbh2wf=Udb1k7r6ru-4FTMQ@mail.gmail.com>
 <20220628085821.kn3jjrviyprgai4w@mail>
 <CAHk-=wie9HSY-MmFr9zHeizRTgSfdONop0-4ezBiq5hYNp4U6g@mail.gmail.com>
In-Reply-To: <CAHk-=wie9HSY-MmFr9zHeizRTgSfdONop0-4ezBiq5hYNp4U6g@mail.gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Wed, 29 Jun 2022 10:42:48 -0400
Message-ID: <CAK-6q+jngywC7UZ6XG=yww16nJQgz0Z=VYKH8Fhg0kbZCkaypA@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 cluster-devel <cluster-devel@redhat.com>,
 Sparse Mailing-list <linux-sparse@vger.kernel.org>, thunder.leizhen@huawei.com,
 jacob.e.keller@intel.com, Andrew Morton <akpm@linux-foundation.org>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, Jun 28, 2022 at 1:27 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, Jun 28, 2022 at 1:58 AM Luc Van Oostenryck
> <luc.vanoostenryck@gmail.com> wrote:
> >
> > I would certainly not recommend this but ...
> > if it's OK to cheat and lie then you can do:
> > +       bool refcount_dec_and_lock(refcount_t *r, spinlock_t *lock) __acquires(lock);
>
> Actually, we have "__cond_lock()" in the kernel to actually document
> that something takes a lock only in certain conditions.
>
> It needs to be declared as a macro in the header file, with this as an example:
>
>    #define raw_spin_trylock(lock)  __cond_lock(lock, _raw_spin_trylock(lock))
>

I added a prefix of "raw_" to refcount_dec_and_lock() and similar
functions and replaced the original functions with the __cond_lock()
macro to redirect to their raw_ functions. Similar to how the
raw_spinlock_trylock() naming scheme is doing it. The "raw_"
functionality should never be called by the user then.

> ie that says that "raw_spin_trylock() takes 'lock' when
> _raw_spin_trylock() returned true".
>
> That then makes it possible to write code like
>
>     if (raw_spin_trylock(lock)) {..
>                  raw_spin_unlock(lock));
>     }
>
> and sparse will get the nesting right.
>
> But that does *not* solve the issue of people then writing this as
>
>     locked = raw_spin_trylock(lock);
>     .. do_something ..
>     if (locked)
>                  raw_spin_unlock(lock));
>
> and you end up with the same thing again.
>

Yes it mostly removed all sparse warnings I see. I needed to move at
one call of the refcount_dec_and_lock() function inside the if
condition and the sparse warning was gone. It should not be a problem
to change it in this way.

If there are no other complaints I will send a patch for the raw_
prefix to all those conditional refcount lock functions and the add a
__cond_lock() macro for the original function calls.

Thanks!

- Alex

