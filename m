Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AA976009C
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Jul 2023 22:42:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690231348;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=L3Te2FA82YICOhPPb5qwWjuzlpdJlAZ9Byx5+/6LLAE=;
	b=NtKxEHWeNL4xLrJFJN86YCGeSwMzfJ/i8s2zvR1evCW3D1EoDgEDMejvfFBH5iNyppbqnw
	X18N4SaQrCg+QWC5hxhQcUwG+H76bK1+YRX05TQy0zxCfYSUyooIQracGB9kgelEDivFKl
	AJvTy0+2/cfa3t8GwKn6EE0Z9OWocqw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-oAotX4JZMm6vkUK9fACyng-1; Mon, 24 Jul 2023 16:42:25 -0400
X-MC-Unique: oAotX4JZMm6vkUK9fACyng-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C9D280269A;
	Mon, 24 Jul 2023 20:42:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0DA171401C2E;
	Mon, 24 Jul 2023 20:42:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BD0281949748;
	Mon, 24 Jul 2023 20:42:22 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D80AB1946589 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 24 Jul 2023 20:42:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AB9211454143; Mon, 24 Jul 2023 20:42:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A3A8A1454142
 for <cluster-devel@redhat.com>; Mon, 24 Jul 2023 20:42:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82952185A7A4
 for <cluster-devel@redhat.com>; Mon, 24 Jul 2023 20:42:21 +0000 (UTC)
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-CtaZvDcgNOCEsEec0UfaYw-1; Mon, 24 Jul 2023 16:42:20 -0400
X-MC-Unique: CtaZvDcgNOCEsEec0UfaYw-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-583fe0f84a5so12294187b3.3
 for <cluster-devel@redhat.com>; Mon, 24 Jul 2023 13:42:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690231339; x=1690836139;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L3Te2FA82YICOhPPb5qwWjuzlpdJlAZ9Byx5+/6LLAE=;
 b=cjqck5pchiki6FmQcV8mmOylyeSEEYhRUnq/QDP4smPtNY2QPxPZypYgPp+S5R2FJ1
 sEpHpm8ydyHbwQwCZyZkfHvAptOtpk8i3zGdEh/Ug7E5QWYp0RcCiiCt+9JJiklXXz5X
 dx1Auzvm+Ik5Ou6KmWdIV7uLWOWQOgrxkTmm22ok0P7+ylmiaMHci0B+H83XoqklfCQD
 /dXAw+MyixKuHIRyjkfGxB2eqb7EWBBMumPjZOVdMnvqo4bW5tYyRaBXLKUYZXznhwNq
 BfjjDr+TCatWY8NDqQW9ol6gTSYjYYJWXikvjXMWUPl13aYMD7Fw1L1Y4Wce1dA6f2eF
 GKAQ==
X-Gm-Message-State: ABy/qLZ/uh/CtTzv6kLNSoCKnWH/cM+uBx99JUnEcjBXNRLvoSiWirUu
 VGgaMMc6D8D7AKgVqtSxl5Zubg5f5nt4D2X2tUTejHIvzFPFEL/p803iHa6/fiT1V0JCvcb9Sdh
 8jG5UN7AN9xltlme78kTltb2NYzA18+q/iOhaTQ==
X-Received: by 2002:a81:4e49:0:b0:573:98a3:f01a with SMTP id
 c70-20020a814e49000000b0057398a3f01amr8329914ywb.40.1690231339670; 
 Mon, 24 Jul 2023 13:42:19 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFUbUqeKSTTy1AlNEicqhIS/iAdK1bb1L1pyJ0bu4d5la64PhveQpKxqjvNUMcEJK5ScP65Y5mMmdr0wS3beHA=
X-Received: by 2002:a81:4e49:0:b0:573:98a3:f01a with SMTP id
 c70-20020a814e49000000b0057398a3f01amr8329907ywb.40.1690231339410; Mon, 24
 Jul 2023 13:42:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230720122241.1381845-1-aahringo@redhat.com>
 <20230720122241.1381845-4-aahringo@redhat.com>
 <CAHc6FU6nHjx2JQn=1_zif-gLFZQHZfwb5E8HHXHcYn67_VV0SQ@mail.gmail.com>
 <CAK-6q+g01Xu+DZN3asom9VHAbBfwvEAO2_Eu8kXHJiuCyhtvEQ@mail.gmail.com>
 <CAHc6FU6PQO3x70Z-Bab_nexHp7p-PiYaRMgDxVgV-TDfk4LO+A@mail.gmail.com>
 <CAK-6q+g6d8p+ZZmNh-xzzi8Z-BRGXsch3WrwJRDueJo-jg79Sg@mail.gmail.com>
In-Reply-To: <CAK-6q+g6d8p+ZZmNh-xzzi8Z-BRGXsch3WrwJRDueJo-jg79Sg@mail.gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Mon, 24 Jul 2023 16:42:07 -0400
Message-ID: <CAK-6q+jziH=_wDDbdgUV6g-dOKBJBZNkNsPKb73rJ6_FhGx-Og@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCHv4 v6.5-rc2 3/3] fs: dlm: fix F_CANCELLK
 to cancel pending request
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
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 24, 2023 at 3:03=E2=80=AFPM Alexander Aring <aahringo@redhat.co=
m> wrote:
>
> Hi,
>
> On Mon, Jul 24, 2023 at 10:40=E2=80=AFAM Andreas Gruenbacher
> <agruenba@redhat.com> wrote:
> >
> > On Fri, Jul 21, 2023 at 8:55=E2=80=AFPM Alexander Aring <aahringo@redha=
t.com> wrote:
> > > Hi,
> > >
> > > On Fri, Jul 21, 2023 at 12:25=E2=80=AFPM Andreas Gruenbacher
> > > <agruenba@redhat.com> wrote:
> > > >
> > > > On Thu, Jul 20, 2023 at 2:22=E2=80=AFPM Alexander Aring <aahringo@r=
edhat.com> wrote:
> > > > > This patch fixes the current handling of F_CANCELLK by not just d=
oing a
> > > > > unlock as we need to try to cancel a lock at first. A unlock make=
s sense
> > > > > on a non-blocking lock request but if it's a blocking lock reques=
t we
> > > > > need to cancel the request until it's not granted yet. This patch=
 is fixing
> > > > > this behaviour by first try to cancel a lock request and if it's =
failed
> > > > > it's unlocking the lock which seems to be granted.
> > > >
> > > > I don't like how this is implemented, but the problem already start=
s
> > > > in commit 57e2c2f2d94c ("fs: dlm: fix mismatch of plock results fro=
m
> > > > userspace"). That commit relies on how dlm_controld is implemented
> > > > internally; it requires dlm_controld to keep all replies to
> > > > non-blocking requests in perfect order. The correctness of that
> > > > approach is more difficult to argue for than it should be, the code
> > > > might break in non-obvious ways, and it limits the kinds of things
> > > > dlm_controld will be able to do in the future. And this change reli=
es
> > > > on the same flawed design.
> > > >
> > >
> > > I agree it is not the best design and I mentioned it in my previous
> > > patch series versions [0]:
> > >
> > > TODO we should move to a instance reference from request and reply an=
d
> > > not go over lock states, but it seems going over lock states and get
> > > the instance does not make any problems (at least there were no issue=
s
> > > found yet) but it's much cleaner to not think about all possible
> > > special cases and states to instance has no 1:1 mapping anymore.
> >
> > I guess by /go over lock states/, you mean what dev_write() does --
> > compare the request and response fields to match requests with
> > responses as well as possible, based on the information that's in
> > struct dlm_plock_info today.
> >
>
> yes, it's what we doing when wait is true.
>
> > > > Instead, when noticing that we don't have a way to uniquely identif=
y
> > > > requests, such a way should just have been introduced. The CANCEL
> > > > request would then carry the same unique identifier as the original
> > > > locking request, dlm_controld would reply either to the original
> > > > locking request or to the cancel request, and the kernel would have=
 no
> > > > problem matching the reply to the request.
> > > >
> > > > But without unique request identifiers, we now end up with those
> > > > redundant -ENOENT replies to CANCEL requests and with those
> > > > essentially duplicate entries for the same request on recv_list. No=
t
> > > > great.
> > > >
> > >
> > > There is no reference of lock request instances between kernel and
> > > user yet. It does it by having a match if it's the same lock request.
> > > The whole mechanism works like this, but one reason why we recently
> > > had problems with it. A lock request is the same in the sense that
> > > they are being granted at the same time. So far we did not experience
> > > any problems with that... but as mentioned in [0] you need to think
> > > about all potential cases.
> >
> > I have no idea what you're talking about.
> >
>
> I mean that currently there are no issues I am aware of and there
> exists no reference between lock request in the kernel and lock
> request in the user. This all goes over the lock states, if they are
> identical as "they are getting granted at the same time".
>
> > Let me point out one thing though: when dlm_controld replies to
> > multiple pending locking requests "in one go", without having to wait
> > on any unlocks to happen, this doesn't mean that those requests are
> > all "the same" at all. The requests may be for the same "actor" on the
> > kernel side, but they don't have to be. As such, it does make sense to
> > treat each of those requests independently.
> >
>
> Now, I have no idea what you are talking about.
>
> > > NOTE: that even F_CANCELLK does not give you a unique reference of th=
e
> > > original locking request, it works over matching the field of struct
> > > file_lock... There is already the same problem. The struct file_lock
> > > pointer could be used, but struct file_lock does not represent a lock
> > > request, this does not exist in VFS posix lock API.
> >
> > It seems to me that struct file_lock objects persist across the entire
> > locking request, both for the synchronous locking requests of gfs2 and
> > for the asynchronous locking requests of lockd. In other words, when
> > lockd cancels a locking request, it seems to use the same struct
> > file_lock object it used for making the original request (see where
> > lockd calls vfs_cancel_lock()). This means that the address of that
> > object would be a suitable locking request identifier. And while we
> > don't have a huge amount of space left in struct dlm_plock_info, we do
> > have two 32-bit fields in the version[] array that we could use for
> > communicating that identifier. It would of course be better if we
> > didn't need that much space, but I don't see a realistic alternative
> > if we want to cleanly fix this whole mess.
>
> Please tell me the API describing that you can use struct file_lock
> pointer to lookup the pending lock. This is implementation specific,
> the next person hacking on lockd does not know that.
> I will try to come up with something. Because 32 bits are limited we
> could run into collisions, but it should be enough for normal usage.
>

A draft can be found under [0].

> But I will not use the file_lock * as lookup, it will work over fields
> which end in the same "mess" behaviour. There could be follow up
> patches to fix the VFS layer to use "lock request" unique identifiers
> but VFS does not have any storage type to keep track of pending lock
> requests so far I know.
>

This problem requires actually 2 ids, one for the plock cancel
operation request match itself. And another one for the plock request
which should be cancelled. I've only implemented the plock cancel
operation request match. The other part is how I see F_CANCELLK is
supposed to work as "match on struct file_lock fields". I am open to
changing this behaviour but it requires more work on VFS.

- Alex

[0] https://gitlab.com/netcoder/linux/-/commit/aa67d0ec656a0d060fe3d0c0d862=
64dea1b2cc7d

