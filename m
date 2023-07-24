Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CF575FF76
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Jul 2023 21:04:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690225439;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kdeYxZ3e4/t6wrzEeF9WljEgP/m8SWPh4xjRFjuJzBk=;
	b=Myl6KJLp/EIXLPbNC7OyYQdMc2aevcUq+DbByU+US22JMRV7Gqjzs0hRQY8Joz887oR6iT
	X39jkqEbq1RZNyL2FrhUE9EYYBqQhd8oKI5I5j0CRU5QQ/Ly3RY7phytN9AQXzoXN5h6RO
	XlyUcjE7gX5OovOhZNRijwAu88j6h5A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-OWj-5-LsN1e3ZDbAjcEg9w-1; Mon, 24 Jul 2023 15:03:55 -0400
X-MC-Unique: OWj-5-LsN1e3ZDbAjcEg9w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C74E788D06E;
	Mon, 24 Jul 2023 19:03:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D7A34C2C856;
	Mon, 24 Jul 2023 19:03:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9D2591949748;
	Mon, 24 Jul 2023 19:03:53 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A3B6C1946589 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 24 Jul 2023 19:03:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 68AC64A9004; Mon, 24 Jul 2023 19:03:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 61A95492C13
 for <cluster-devel@redhat.com>; Mon, 24 Jul 2023 19:03:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 452F11064FC2
 for <cluster-devel@redhat.com>; Mon, 24 Jul 2023 19:03:52 +0000 (UTC)
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-4IxFELXKNmmthpGgG11TZg-1; Mon, 24 Jul 2023 15:03:50 -0400
X-MC-Unique: 4IxFELXKNmmthpGgG11TZg-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-5840614b13cso13048047b3.0
 for <cluster-devel@redhat.com>; Mon, 24 Jul 2023 12:03:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690225430; x=1690830230;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kdeYxZ3e4/t6wrzEeF9WljEgP/m8SWPh4xjRFjuJzBk=;
 b=Jkw7vwjXYD8u/IFNrxwZOc1irrtweipefmeE5EK4qTwCwQi8G5KLYO3LHX83yJE3vD
 dAnmCGk84m74g5l/AWnky+OeIzTDlarxCHxwnM0e+e75s1TuxA0qnpvjukuCdwgDdeID
 TmQH6QxIXo9e3ty+Fahsg2FSK504EdIszUxDuDkPj2/w0VZ7qpM8Ap+HEajeNJ5rD2Lm
 BeHxvTCFQFxA59xwUHbuESQpYacMzCiXFBCPZyduy57pNThOGP/vfDx9NRopI+JtJ88B
 LC6xokHaBoGuF3sex90VY+dMVLcdC/mOsRh3fTTDksjMQVge65H0ujSJXpcGdHbBy8HQ
 zvKg==
X-Gm-Message-State: ABy/qLb72QwtZYyFruiAoVdTw/+hOPoqlCd3nOmVXgOKhqCJbotvc0sd
 WZH6IbtKjh/A9TwX3wk6QcEavW3QA3zvnv4XMpe1U+4Ph09EifmQo9bGcZmnyMb6xFEfxov2/FQ
 aMUDwpvW0MkT65SXIZDkDz11edgf5FeEvwySCJg==
X-Received: by 2002:a81:484c:0:b0:583:8c61:de8 with SMTP id
 v73-20020a81484c000000b005838c610de8mr69495ywa.16.1690225429928; 
 Mon, 24 Jul 2023 12:03:49 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHbSrYcazEZAiSW951friYxBUXBjj52OCU1Gu3atCebDdGF0b16cxfPivST1PWdrR+2LxA2th1/kKibNneMPzo=
X-Received: by 2002:a81:484c:0:b0:583:8c61:de8 with SMTP id
 v73-20020a81484c000000b005838c610de8mr69478ywa.16.1690225429670; Mon, 24 Jul
 2023 12:03:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230720122241.1381845-1-aahringo@redhat.com>
 <20230720122241.1381845-4-aahringo@redhat.com>
 <CAHc6FU6nHjx2JQn=1_zif-gLFZQHZfwb5E8HHXHcYn67_VV0SQ@mail.gmail.com>
 <CAK-6q+g01Xu+DZN3asom9VHAbBfwvEAO2_Eu8kXHJiuCyhtvEQ@mail.gmail.com>
 <CAHc6FU6PQO3x70Z-Bab_nexHp7p-PiYaRMgDxVgV-TDfk4LO+A@mail.gmail.com>
In-Reply-To: <CAHc6FU6PQO3x70Z-Bab_nexHp7p-PiYaRMgDxVgV-TDfk4LO+A@mail.gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Mon, 24 Jul 2023 15:03:38 -0400
Message-ID: <CAK-6q+g6d8p+ZZmNh-xzzi8Z-BRGXsch3WrwJRDueJo-jg79Sg@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 24, 2023 at 10:40=E2=80=AFAM Andreas Gruenbacher
<agruenba@redhat.com> wrote:
>
> On Fri, Jul 21, 2023 at 8:55=E2=80=AFPM Alexander Aring <aahringo@redhat.=
com> wrote:
> > Hi,
> >
> > On Fri, Jul 21, 2023 at 12:25=E2=80=AFPM Andreas Gruenbacher
> > <agruenba@redhat.com> wrote:
> > >
> > > On Thu, Jul 20, 2023 at 2:22=E2=80=AFPM Alexander Aring <aahringo@red=
hat.com> wrote:
> > > > This patch fixes the current handling of F_CANCELLK by not just doi=
ng a
> > > > unlock as we need to try to cancel a lock at first. A unlock makes =
sense
> > > > on a non-blocking lock request but if it's a blocking lock request =
we
> > > > need to cancel the request until it's not granted yet. This patch i=
s fixing
> > > > this behaviour by first try to cancel a lock request and if it's fa=
iled
> > > > it's unlocking the lock which seems to be granted.
> > >
> > > I don't like how this is implemented, but the problem already starts
> > > in commit 57e2c2f2d94c ("fs: dlm: fix mismatch of plock results from
> > > userspace"). That commit relies on how dlm_controld is implemented
> > > internally; it requires dlm_controld to keep all replies to
> > > non-blocking requests in perfect order. The correctness of that
> > > approach is more difficult to argue for than it should be, the code
> > > might break in non-obvious ways, and it limits the kinds of things
> > > dlm_controld will be able to do in the future. And this change relies
> > > on the same flawed design.
> > >
> >
> > I agree it is not the best design and I mentioned it in my previous
> > patch series versions [0]:
> >
> > TODO we should move to a instance reference from request and reply and
> > not go over lock states, but it seems going over lock states and get
> > the instance does not make any problems (at least there were no issues
> > found yet) but it's much cleaner to not think about all possible
> > special cases and states to instance has no 1:1 mapping anymore.
>
> I guess by /go over lock states/, you mean what dev_write() does --
> compare the request and response fields to match requests with
> responses as well as possible, based on the information that's in
> struct dlm_plock_info today.
>

yes, it's what we doing when wait is true.

> > > Instead, when noticing that we don't have a way to uniquely identify
> > > requests, such a way should just have been introduced. The CANCEL
> > > request would then carry the same unique identifier as the original
> > > locking request, dlm_controld would reply either to the original
> > > locking request or to the cancel request, and the kernel would have n=
o
> > > problem matching the reply to the request.
> > >
> > > But without unique request identifiers, we now end up with those
> > > redundant -ENOENT replies to CANCEL requests and with those
> > > essentially duplicate entries for the same request on recv_list. Not
> > > great.
> > >
> >
> > There is no reference of lock request instances between kernel and
> > user yet. It does it by having a match if it's the same lock request.
> > The whole mechanism works like this, but one reason why we recently
> > had problems with it. A lock request is the same in the sense that
> > they are being granted at the same time. So far we did not experience
> > any problems with that... but as mentioned in [0] you need to think
> > about all potential cases.
>
> I have no idea what you're talking about.
>

I mean that currently there are no issues I am aware of and there
exists no reference between lock request in the kernel and lock
request in the user. This all goes over the lock states, if they are
identical as "they are getting granted at the same time".

> Let me point out one thing though: when dlm_controld replies to
> multiple pending locking requests "in one go", without having to wait
> on any unlocks to happen, this doesn't mean that those requests are
> all "the same" at all. The requests may be for the same "actor" on the
> kernel side, but they don't have to be. As such, it does make sense to
> treat each of those requests independently.
>

Now, I have no idea what you are talking about.

> > NOTE: that even F_CANCELLK does not give you a unique reference of the
> > original locking request, it works over matching the field of struct
> > file_lock... There is already the same problem. The struct file_lock
> > pointer could be used, but struct file_lock does not represent a lock
> > request, this does not exist in VFS posix lock API.
>
> It seems to me that struct file_lock objects persist across the entire
> locking request, both for the synchronous locking requests of gfs2 and
> for the asynchronous locking requests of lockd. In other words, when
> lockd cancels a locking request, it seems to use the same struct
> file_lock object it used for making the original request (see where
> lockd calls vfs_cancel_lock()). This means that the address of that
> object would be a suitable locking request identifier. And while we
> don't have a huge amount of space left in struct dlm_plock_info, we do
> have two 32-bit fields in the version[] array that we could use for
> communicating that identifier. It would of course be better if we
> didn't need that much space, but I don't see a realistic alternative
> if we want to cleanly fix this whole mess.

Please tell me the API describing that you can use struct file_lock
pointer to lookup the pending lock. This is implementation specific,
the next person hacking on lockd does not know that.
I will try to come up with something. Because 32 bits are limited we
could run into collisions, but it should be enough for normal usage.

But I will not use the file_lock * as lookup, it will work over fields
which end in the same "mess" behaviour. There could be follow up
patches to fix the VFS layer to use "lock request" unique identifiers
but VFS does not have any storage type to keep track of pending lock
requests so far I know.

- Alex

