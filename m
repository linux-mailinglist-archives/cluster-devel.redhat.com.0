Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A72F55BCC4
	for <lists+cluster-devel@lfdr.de>; Tue, 28 Jun 2022 02:57:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656377823;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Le9rasWFftvBUIXdCkHOfomOzNQQm9TeUsAxHwjuOAw=;
	b=SHh8XVxUJCcaImvCYRMjYGFEdjjZJJm1pl0Njt7A/Opa5s5nhme4YOrjNssUnEuN1fIK0y
	rnuz9pisowNfdGerNAdMXjb6U0NZ0pjWe6qGxqbL/YBoFdnaUwcHz436KeYB0Z8FCnzwa7
	O5KiGdVNIsaclPgXjgEYrKIm+1nDvao=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-rPTMreJLM9CWW7px9zhtkQ-1; Mon, 27 Jun 2022 20:57:00 -0400
X-MC-Unique: rPTMreJLM9CWW7px9zhtkQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 351A829AB42F;
	Tue, 28 Jun 2022 00:56:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A3E63404E4DE;
	Tue, 28 Jun 2022 00:56:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3A869194704E;
	Tue, 28 Jun 2022 00:56:57 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8F5B1194704A for <cluster-devel@listman.corp.redhat.com>;
 Tue, 28 Jun 2022 00:56:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EBA26815B; Tue, 28 Jun 2022 00:56:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E82E89D54
 for <cluster-devel@redhat.com>; Tue, 28 Jun 2022 00:56:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD4423C0CD3E
 for <cluster-devel@redhat.com>; Tue, 28 Jun 2022 00:56:55 +0000 (UTC)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-izJmxkNxMNmdrIzftvrzTw-1; Mon, 27 Jun 2022 20:56:54 -0400
X-MC-Unique: izJmxkNxMNmdrIzftvrzTw-1
Received: by mail-qk1-f198.google.com with SMTP id
 bj2-20020a05620a190200b005084968bb24so11920905qkb.23
 for <cluster-devel@redhat.com>; Mon, 27 Jun 2022 17:56:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Le9rasWFftvBUIXdCkHOfomOzNQQm9TeUsAxHwjuOAw=;
 b=4YQZnMKKlG9Hc9B5IEAhZiPKONFl4lxPl4CYQs5jGBWJC7C+MxZzuZJsWAX4hwDJNy
 dB71ZwqWC8y5lx+JQ79KSlMobQyV8f6mg81G/nS4Y7z4V7dWtXavER23VKOvuB+7GeL3
 bkxmQt5NSw2sKuH74i7sojCXnGOgO9R3b6B1FLKPpcHnP+hF5wU7H4CzvnLZGyiW3UHU
 mtJP/HrD4fk5IOhAx4SlqM4nGxIxz5pXpata1MZl00w7y/X28rFZk0vI/I0RSm0WQKfs
 ygoOwjL3kfYJYTUEP2X7TDZBgVzbuzMmZ++dXQuxe2gvB/6vQ4pzfTJr61w6FC8AoRHm
 PvtA==
X-Gm-Message-State: AJIora+NQx/jK5c9GtXcaIQwOSxNhBzZrQcLqLLjdFSD4QbB44IyfEIr
 GPgP9VdLUCqkaemC8G4T3zVWJkgOtXKspKjmohyyh1shtAeziUtfqU4jnTi3Ziq4vBTpfNAGi56
 L+ZSzQiP+6se0aUr4gISYKsFtasB96D4dIo0hAQ==
X-Received: by 2002:a05:622a:1306:b0:31a:f73e:3d6d with SMTP id
 v6-20020a05622a130600b0031af73e3d6dmr4502028qtk.339.1656377814095; 
 Mon, 27 Jun 2022 17:56:54 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sFL8MzmxZyh2qnSdqly13+uMFK0IBDjQrSTquxB94TtYvbMTQHQ5Agm2zgV9VXjYMWhLtxVo1TwdIgig7APGY=
X-Received: by 2002:a05:622a:1306:b0:31a:f73e:3d6d with SMTP id
 v6-20020a05622a130600b0031af73e3d6dmr4502021qtk.339.1656377813876; Mon, 27
 Jun 2022 17:56:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAK-6q+hd-L54cqOiFNuufS2_VF5XS0R8cjQL7es8921+2u3uwQ@mail.gmail.com>
 <20220627184232.tjfuzeir57l3h5ll@mail>
In-Reply-To: <20220627184232.tjfuzeir57l3h5ll@mail>
From: Alexander Aring <aahringo@redhat.com>
Date: Mon, 27 Jun 2022 20:56:42 -0400
Message-ID: <CAK-6q+haOfQD8_N6pEm80BTrUXwaj07ZBcXP-EBHftpTVEc1XQ@mail.gmail.com>
To: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, jacob.e.keller@intel.com,
 akpm@linux-foundation.org, thunder.leizhen@huawei.com
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
Cc: cluster-devel <cluster-devel@redhat.com>, linux-sparse@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Luc and others,

On Mon, Jun 27, 2022 at 2:42 PM Luc Van Oostenryck
<luc.vanoostenryck@gmail.com> wrote:
>
> On Mon, Jun 27, 2022 at 11:15:17AM -0400, Alexander Aring wrote:
> > Hi,
> >
> > I recently converted to use kref_put_lock() in fs/dlm subsystem and
> > now I get the following warning in sparse:
> >
> > warning: context imbalance in 'put_rsb' - unexpected unlock
> >
> > It seems sparse is not able to detect that there is a conditional
> > requirement that the lock passed to kref_put_lock() (or also
> > refcount_dec_and_lock()) is locked or not. I evaluate the return value
> > to check if kref_put_lock() helds the lock and unlock it then. The
> > idea is that the lock needs only to be held when the refcount is going
> > to be zero.
> >
> > It seems other users unlock the lock at the release callback of
> > kref_put_lock() and annotate the callback with "__releases()" which
> > seems to work to avoid the sparse warning. However this works if you
> > don't have additional stack pointers which you need to pass to the
> > release callback.
> >
> > My question would be is this a known problem and a recommended way to
> > avoid this sparse warning (maybe just for now)?
>
> Hi,
>
> I suppose that your case here can be simplified into something like:
>
>         if (some_condition)
>                 take(some_lock);
>
>         do_stuff();
>
>         if (some_condition)
>                 release(some_lock);
>
> Sparse issues the 'context imbalance' warning because, a priori,
> it can't exclude that some execution will takes the lock and not
> releases it (or the opposite). In some case, when do_stuff() is
> very simple, sparse can see that everything is OK, but generally
> it won't (some whole kernel analysis but the general case is
> undecidable anyway).
>
> The recommended way would be to write things rather like this:
>
>         if (some_condition) {
>                 take(some_lock);
>                 do_stuff();
>                 release(some_lock);
>         } else {
>                 do_stuff();
>         }
>

This is not an alternative for me because the lock needs to hold
during the "some_condition". (More background is that we dealing with
data structures here and cannot allow a get() from this data
structures during "some_condition", the lock is preventing this)
It is the refcount code which causes trouble here [0] and I think the
refcount code should never call the unlock() procedure in any
condition and leave it to the caller to call unlock() in any case.

I to'ed (hope to get more attention to this) more people related to
lib/refcount.c implementation (provided by get_maintainers.pl -f).

>
> The __acquires() and __releases() annotations are needed for sparse
> to know that the annotated function always take or always release
> some lock but won't handle conditional locks.
>

If we change the refcount code to _never_ calling unlock() for the
specific lock, then all those foo_and_lock_bar() functions can be
annotated with "__acquires()". This should also end in the same code?
For me it looks like the current implementation of refcount.c is fine
except sparse cannot figure out what's going on and maybe a reason to
change the specific handling to the mentioned one.

> I hope that this is helpful to you.
>

I hope we will find some solution, because I don't like sparse warnings.

- Alex

[0] https://elixir.bootlin.com/linux/v5.19-rc4/source/lib/refcount.c#L144

