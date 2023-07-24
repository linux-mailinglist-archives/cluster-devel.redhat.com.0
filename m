Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D40F975FA0A
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Jul 2023 16:41:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690209662;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iEEnpsaB6AUlFn7GPTIyWh13LSum0HmuNShCHfm7ISE=;
	b=feYLfXWJunVHexATHhrMPGM3ggJ40qEC59fD624YZMUdireWUl9SU7cR5kLkRy9wOR89/n
	6d7isPBhV3wG6QmahcXIPzgxi9DNvOLXO3Bl2+Gx0xArQCgBcgdESegKskBHtYc14R5jZF
	uevE6uJep402Ny6n7j2hLjnPEsV1lPU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294-42tHn2XUNTyxz9EYaPaG2g-1; Mon, 24 Jul 2023 10:40:59 -0400
X-MC-Unique: 42tHn2XUNTyxz9EYaPaG2g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D5281044589;
	Mon, 24 Jul 2023 14:40:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 09553492C13;
	Mon, 24 Jul 2023 14:40:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A5B1019451D4;
	Mon, 24 Jul 2023 14:40:55 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6018C1946589 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 24 Jul 2023 14:40:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 489F2201EE6E; Mon, 24 Jul 2023 14:40:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 40AF6201F11C
 for <cluster-devel@redhat.com>; Mon, 24 Jul 2023 14:40:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F7BD38117E7
 for <cluster-devel@redhat.com>; Mon, 24 Jul 2023 14:40:42 +0000 (UTC)
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-za5oQNOvMMauGugTi8lePg-1; Mon, 24 Jul 2023 10:40:41 -0400
X-MC-Unique: za5oQNOvMMauGugTi8lePg-1
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-1bb893e6288so21673505ad.3
 for <cluster-devel@redhat.com>; Mon, 24 Jul 2023 07:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690209638; x=1690814438;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iEEnpsaB6AUlFn7GPTIyWh13LSum0HmuNShCHfm7ISE=;
 b=g0NT0WGAF035WyQ1OjF3VQYkYnqu6qDI7ed2P7Ir3i1VJobemhY7Zw4oBPiyvsb0Qi
 rfYgSgmdO6UEYf/p8Pv7/fjU/pV4nufeFoCaN1FlejJohZYN4uyvVWx9fAjS024Qw6El
 Pz4jBDCrUMwpZnfW2wwBAbBIebnTAuv8mCAOgCUUr1OggzUg/gza77VzzpR6EIaSg2gT
 dZnd+YvRPVw1DNkYQsCYZitJgF1LsoGZXgF6mKhD2x95j6/BX09qNeAvyLQhuguuI7Lr
 0TEnzHdo0xdIPmSVvi/ghltnRyxiPol2DUg7xe0zZE3PKk3/7YWFN7yjLILUpqcCA8pg
 kriA==
X-Gm-Message-State: ABy/qLZCFAqaMvrQ2sSyD1V0pdGO+J5qi6fY15K5q7sfSSrsxC3ln9L3
 wkg+mfAJ48t+o0H4o+NXdUskKdFwXe+7vs26ebX7QFP5mmxUqknzWmHG12x/z7i2dbdL1LnuU39
 e17ULo1tn7m4xZULpqGNTrQNnZx6N7pkq6EQvJmHOdwi4U5bd
X-Received: by 2002:a17:903:1106:b0:1b0:4205:8501 with SMTP id
 n6-20020a170903110600b001b042058501mr13164145plh.6.1690209638685; 
 Mon, 24 Jul 2023 07:40:38 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHbIpClJLgKX7EkTc+Jt1rSCTefWde9c6IzochQRahZAPxA9xgI7xWI0zv0tb2FCWdS/4/eK++z5p86DQPGKGE=
X-Received: by 2002:a17:903:1106:b0:1b0:4205:8501 with SMTP id
 n6-20020a170903110600b001b042058501mr13164133plh.6.1690209638397; Mon, 24 Jul
 2023 07:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230720122241.1381845-1-aahringo@redhat.com>
 <20230720122241.1381845-4-aahringo@redhat.com>
 <CAHc6FU6nHjx2JQn=1_zif-gLFZQHZfwb5E8HHXHcYn67_VV0SQ@mail.gmail.com>
 <CAK-6q+g01Xu+DZN3asom9VHAbBfwvEAO2_Eu8kXHJiuCyhtvEQ@mail.gmail.com>
In-Reply-To: <CAK-6q+g01Xu+DZN3asom9VHAbBfwvEAO2_Eu8kXHJiuCyhtvEQ@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 24 Jul 2023 16:40:26 +0200
Message-ID: <CAHc6FU6PQO3x70Z-Bab_nexHp7p-PiYaRMgDxVgV-TDfk4LO+A@mail.gmail.com>
To: Alexander Aring <aahringo@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 21, 2023 at 8:55=E2=80=AFPM Alexander Aring <aahringo@redhat.co=
m> wrote:
> Hi,
>
> On Fri, Jul 21, 2023 at 12:25=E2=80=AFPM Andreas Gruenbacher
> <agruenba@redhat.com> wrote:
> >
> > On Thu, Jul 20, 2023 at 2:22=E2=80=AFPM Alexander Aring <aahringo@redha=
t.com> wrote:
> > > This patch fixes the current handling of F_CANCELLK by not just doing=
 a
> > > unlock as we need to try to cancel a lock at first. A unlock makes se=
nse
> > > on a non-blocking lock request but if it's a blocking lock request we
> > > need to cancel the request until it's not granted yet. This patch is =
fixing
> > > this behaviour by first try to cancel a lock request and if it's fail=
ed
> > > it's unlocking the lock which seems to be granted.
> >
> > I don't like how this is implemented, but the problem already starts
> > in commit 57e2c2f2d94c ("fs: dlm: fix mismatch of plock results from
> > userspace"). That commit relies on how dlm_controld is implemented
> > internally; it requires dlm_controld to keep all replies to
> > non-blocking requests in perfect order. The correctness of that
> > approach is more difficult to argue for than it should be, the code
> > might break in non-obvious ways, and it limits the kinds of things
> > dlm_controld will be able to do in the future. And this change relies
> > on the same flawed design.
> >
>
> I agree it is not the best design and I mentioned it in my previous
> patch series versions [0]:
>
> TODO we should move to a instance reference from request and reply and
> not go over lock states, but it seems going over lock states and get
> the instance does not make any problems (at least there were no issues
> found yet) but it's much cleaner to not think about all possible
> special cases and states to instance has no 1:1 mapping anymore.

I guess by /go over lock states/, you mean what dev_write() does --
compare the request and response fields to match requests with
responses as well as possible, based on the information that's in
struct dlm_plock_info today.

> > Instead, when noticing that we don't have a way to uniquely identify
> > requests, such a way should just have been introduced. The CANCEL
> > request would then carry the same unique identifier as the original
> > locking request, dlm_controld would reply either to the original
> > locking request or to the cancel request, and the kernel would have no
> > problem matching the reply to the request.
> >
> > But without unique request identifiers, we now end up with those
> > redundant -ENOENT replies to CANCEL requests and with those
> > essentially duplicate entries for the same request on recv_list. Not
> > great.
> >
>
> There is no reference of lock request instances between kernel and
> user yet. It does it by having a match if it's the same lock request.
> The whole mechanism works like this, but one reason why we recently
> had problems with it. A lock request is the same in the sense that
> they are being granted at the same time. So far we did not experience
> any problems with that... but as mentioned in [0] you need to think
> about all potential cases.

I have no idea what you're talking about.

Let me point out one thing though: when dlm_controld replies to
multiple pending locking requests "in one go", without having to wait
on any unlocks to happen, this doesn't mean that those requests are
all "the same" at all. The requests may be for the same "actor" on the
kernel side, but they don't have to be. As such, it does make sense to
treat each of those requests independently.

> NOTE: that even F_CANCELLK does not give you a unique reference of the
> original locking request, it works over matching the field of struct
> file_lock... There is already the same problem. The struct file_lock
> pointer could be used, but struct file_lock does not represent a lock
> request, this does not exist in VFS posix lock API.

It seems to me that struct file_lock objects persist across the entire
locking request, both for the synchronous locking requests of gfs2 and
for the asynchronous locking requests of lockd. In other words, when
lockd cancels a locking request, it seems to use the same struct
file_lock object it used for making the original request (see where
lockd calls vfs_cancel_lock()). This means that the address of that
object would be a suitable locking request identifier. And while we
don't have a huge amount of space left in struct dlm_plock_info, we do
have two 32-bit fields in the version[] array that we could use for
communicating that identifier. It would of course be better if we
didn't need that much space, but I don't see a realistic alternative
if we want to cleanly fix this whole mess.

Thanks,
Andreas

> - Alex
>
> [0] https://listman.redhat.com/archives/cluster-devel/2023-July/024477.ht=
ml
>

