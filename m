Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6C6E13392D9
	for <lists+cluster-devel@lfdr.de>; Fri, 12 Mar 2021 17:15:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615565707;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=axuDzzFtRvX6+v5eu0MNb4G/x2kMzb/eS2yMsXPN/yU=;
	b=SPJPLCnRA0c5x4lAYEh90TrPxfPs+ZMPFcrPwcHvyOkU7aR9hMs14fVYhwMJ4T8W+tjvd/
	TQAJEnHrnDh0tLD3ZeSPTIs5O8qqo1lm+mmnKDA8HZWsFWSC+w3s72gFY3jGX+cNguViC/
	KNb2ZdcAR2OAGNoMqKsFfqM51ddLTuw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-D4HAEF_uNPOUN-fNT0NKGg-1; Fri, 12 Mar 2021 11:15:06 -0500
X-MC-Unique: D4HAEF_uNPOUN-fNT0NKGg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A49680D686;
	Fri, 12 Mar 2021 16:15:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7945D5C1D1;
	Fri, 12 Mar 2021 16:15:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7BD6A18095C9;
	Fri, 12 Mar 2021 16:15:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12CEqkHY011216 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 12 Mar 2021 09:52:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 93B222068FFF; Fri, 12 Mar 2021 14:52:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 89510207A639
	for <cluster-devel@redhat.com>; Fri, 12 Mar 2021 14:52:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3592582402C
	for <cluster-devel@redhat.com>; Fri, 12 Mar 2021 14:52:41 +0000 (UTC)
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
	[209.85.166.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-533-MAyvvHzgOlea5YGPKXQSnA-1; Fri, 12 Mar 2021 09:52:38 -0500
X-MC-Unique: MAyvvHzgOlea5YGPKXQSnA-1
Received: by mail-io1-f72.google.com with SMTP id e11so17948477ioh.11
	for <cluster-devel@redhat.com>; Fri, 12 Mar 2021 06:52:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=axuDzzFtRvX6+v5eu0MNb4G/x2kMzb/eS2yMsXPN/yU=;
	b=JJpDT2eqJWqJEsUmLPF9SeiJFo7uEj3txL0sc5RaFe8aloWpX2vJZKvf9QdKyfVCxM
	28lOz+b76fITpZVT2WzlV6pPQxEnwtN0W4/2dPky/YAlYhw7YAALNsNDzcbNugEzz6T0
	AdzwNA6n8t68xDqbBIBQkr1hGTdkrD0uJX1GeNRWqGkchfiv7lUPUuRy5FBmbLyDywQF
	G2pNOSZZafmCgr6Nc7L1YrIR00gNA3A6EqMoyuRFT1GnJ3NqmkxRHNq7MkSKGCCY10bs
	j7w2bvQwui9XbOzyfbjGoVXl69SM4r6Os+76YGms4cG+0swdVr7tSBBraEVT+vqXTl5k
	LW8Q==
X-Gm-Message-State: AOAM530YifVlV0vlYmVoCUz6RM6I6WRQ/vKompdytmpbIqFdsKEwJ2fB
	QM4BrI2VAjuurIVdxzmZQDwSQsy7gitgRS66+EhxPiMy3BGyVFJilqfxFNSb52hOTFBreagaXuw
	spWjlnyS2oitx0y/s1fDYt6z2D8/g7qbFyekX8Q==
X-Received: by 2002:a5d:8249:: with SMTP id n9mr10556424ioo.31.1615560757647; 
	Fri, 12 Mar 2021 06:52:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwKA1Pz6KSBZ/8FCKLgM/iklUKNidIqnEIGn6AO6IoVK9WUOLotr1EzPDZEi+1swUpHgIJIKnu5Dt0BEBnX5es=
X-Received: by 2002:a5d:8249:: with SMTP id n9mr10556404ioo.31.1615560757309; 
	Fri, 12 Mar 2021 06:52:37 -0800 (PST)
MIME-Version: 1.0
References: <20210310191745.80824-1-aahringo@redhat.com>
	<7536fa5a3661675c583a448cf1bbc3f026bfea23.camel@redhat.com>
In-Reply-To: <7536fa5a3661675c583a448cf1bbc3f026bfea23.camel@redhat.com>
From: Alexander Ahring Oder Aring <aahringo@redhat.com>
Date: Fri, 12 Mar 2021 09:52:26 -0500
Message-ID: <CAK-6q+hueOPUSUpCM2ksfgtNPB9HSvSy9HLUZvLPi+g9v0Cmiw@mail.gmail.com>
To: Paolo Abeni <pabeni@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Guillaume Nault <gnault@redhat.com>
Subject: Re: [Cluster-devel] [PATCHv2 dlm/next 0/8] fs: dlm: introduce dlm
	re-transmission layer
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
Content-Type: text/plain; charset="UTF-8"

Hi Paolo,

On Thu, Mar 11, 2021 at 4:09 AM Paolo Abeni <pabeni@redhat.com> wrote:
>
> Hello,
>
> Thank you for the new version.
>
> On Wed, 2021-03-10 at 14:17 -0500, Alexander Aring wrote:
> > this is the final patch-series to make dlm reliable when re-connection
> > occurs. You can easily generate a couple of re-connections by running:
> >
> > tcpkill -9 -i $IFACE port 21064
> >
> > on your own to test these patches. At some time dlm will detect message
> > drops and will re-transmit messages if necessary. It introduces a new dlm
> > protocol behaviour and increases the dlm protocol version. I tested it
> > with SCTP as well and tried to be backwards compatible with dlm protocol
> > version 3.1. However I don't recommend at all to mix these versions
> > in a setup since dlm version 3.2 fixes long-term issues.
> >
> > - Alex
> >
> > changes since v2:
> >  - make timer handling pending only if messages are on air, the sync
> >    isn't quite correct there but doesn't need to be precise
> >  - use before() from tcp to check if seq is before other seq with
> >    respect of overflows
> >  - change srcu handling to hold srcu in all places where nodes are
> >    referencing - we should not get a disadvantage of holding that
> >    lock. We should update also lowcomms regarding to that.
> >  - add some WARN_ON() to check that nothing in send/recv is going
> >    anymore otherwise it's likely an issue.
> >  - add more future work regarding to fencing of nodes if over
> >    cluster manager timeout/bad seq happens
> >  - add note about missing length size check of tail payload
> >    (resource name length) regarding to the receive buffer
> >  - remove some include which isn't necessary in recoverd.c
>
> I plan/hope to go through this iteration at the very end of this week
> or early next one.
>
> I just noticed that some email from you targeting netdev landed in my
> spam folder thanks to our corporate anti-spam filter. So I possibly
> lost some replies from you. If you already answered the following, I'm
> sorry I lost that but it's not my fault! Please kindly resend the
> message ;)
>

ok. I will answer it below.

> The relevant questions was/are:
>
> - is there git tree avail with all the series applied, to help with the
> review?

They are based on [0]. You can apply them or I can upload them in
gitlab if you want.

> - DEFAULT_BUFFER_SIZE == LOWCOMMS_MAX_TX_BUFFER_LEN in current net-
> next, so looks like a change below is actually a no op ?!?

It's LOWCOMMS_MAX_TX_BUFFER_LEN updated in patch 7/8:

#define LOWCOMMS_MAX_TX_BUFFER_LEN     (DEFAULT_BUFFER_SIZE -
DLM_MIDCOMMS_OPT_LEN)

whereas DEFAULT_BUFFER_SIZE is the maximum possible dlm message size
at socket layer level. Mainly this is limited because we can get a
maximum page buffer allocation for the dlm application layer only and
the application layer cannot deal with any additional logic to handle
more. However that is also an architecture thing, because it needs to
be the minimal page buffer size of all architecture due compatibility
with other architectures. I introduced a check which should report
problems if architectures doesn't support it:

BUILD_BUG_ON(PAGE_SIZE < DEFAULT_BUFFER_SIZE);

LOWCOMMS_MAX_TX_BUFFER_LEN is the length after the encapsulation
header, the size "what the dlm application layer can maximum put in a
message" on application layer level.

The names are misnamed, it's on my list to update them. Any
recommendations (MAX_DLM_SOCKET_BUFFER_SIZE/MAX_DLM_APP_BUFFER_SIZE)?

> - Could you please add more info WRT the reference to unaligned memory
> access in the code comments? Which field[s] is[are] subject to that?
>

none of these fields. Some of the DLM messages have a variable sized
payload at the tail. It's a string value. This string length needs to
be 8 byte aligned. The kernel violate this, however there exists an
userspace API and the user needs to define this string value. One user
is lvm, lvm uses an unique identifier the UUID of the volume for this
string value, the UUID string value is 36 chars. It will end in a
message boundary issue which will/can end in unaligned memory access
at the sending side (because of some internal buffer handling) and the
receiving side. I tried to fix it by filling zero bytes to this string
but the problem is more complicated as David Teigland pointed out to
still have backwards compatibility. I would like to schedule to fix
the issue in a next major version bump of dlm.

Thanks for your review.

- Alex

[0] https://git.kernel.org/pub/scm/linux/kernel/git/teigland/linux-dlm.git/log/?h=next

