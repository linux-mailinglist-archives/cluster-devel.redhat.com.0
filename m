Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A2249D362
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Jan 2022 21:25:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643228734;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=l/f4SbDskEdju8/ujJbeu3HorcjyliWi4DjB0YbspNg=;
	b=XaxrOrN1qyqw7RVhbU0dLXYhL+Va/ysdazXY//RY24qjs5EhIDPZ4RpHOywJwRxa2gYdPd
	hPof7LVksWvNzRs9DQbhP2rR+6xQGMCKllKtIoDmKPrjdXLhykcMcVZOC0lN2s0mAMnce7
	wh8h1Rffo+nEhrBy3M+fx76MrXf2ssc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-rpnvJv-IMtu06hel9wADag-1; Wed, 26 Jan 2022 15:25:30 -0500
X-MC-Unique: rpnvJv-IMtu06hel9wADag-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A23C1006AA0;
	Wed, 26 Jan 2022 20:25:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F403A4BC5E;
	Wed, 26 Jan 2022 20:25:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 663511809CB8;
	Wed, 26 Jan 2022 20:25:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
	[10.11.54.7])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20QKPNrN023719 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 26 Jan 2022 15:25:23 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7E6301457F05; Wed, 26 Jan 2022 20:25:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A9D61457F04
	for <cluster-devel@redhat.com>; Wed, 26 Jan 2022 20:25:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6107C3C01C00
	for <cluster-devel@redhat.com>; Wed, 26 Jan 2022 20:25:23 +0000 (UTC)
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
	[209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-544-_oSG6PG3PH-IUa_M8V_sDw-1; Wed, 26 Jan 2022 15:25:22 -0500
X-MC-Unique: _oSG6PG3PH-IUa_M8V_sDw-1
Received: by mail-qt1-f200.google.com with SMTP id
	x5-20020ac84d45000000b002cf826b1a18so649781qtv.2
	for <cluster-devel@redhat.com>; Wed, 26 Jan 2022 12:25:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=l/f4SbDskEdju8/ujJbeu3HorcjyliWi4DjB0YbspNg=;
	b=Hewb0E1sMPLrE/cpWYZCe65YBmpeacsjDXbMhTZrdJd6LhS6RHVeSGq72Oiix66fO3
	GwKYe9ucfxdnF91xEbkkxr1WBoPJNTpy1JhJVrxPSdMz9Eo1dtrwe8O8B9ZVzjqo4bXZ
	fnj4JE/ad5NvL9aonCcYNF4BD2AeyaMQLp6afB35TL4gENAQLKgX+zSCbgu8HfOEAiJH
	DYonpBlwB6CAekxhr/otbHPfJNO67NdSBTHqfPq9caZuv+sYlQGqQZac+feyBPpzaYu6
	sbbA0WtoF4LyyARjEMLwx8LvWV2SOIAmo588VPv0WYhE6VVaQ91xFi+pycT0AO89dvx/
	mQFA==
X-Gm-Message-State: AOAM531Z4+h3eUeQMj/WBz0s5jqtvHH3fro+ge4OUDZj0plu4xjafwG1
	VKwLKt4B4UCA+WRkXwPjjyIHa7rRRqlolJA9HNq0H5jdG7Qj+j7z+6FHOsFxjBiW+QgdJLJMyAh
	M4uDfJ++d7OQgAhoxg/kckhkbk3WMrYGyuDC9Vw==
X-Received: by 2002:a05:6214:21e8:: with SMTP id
	p8mr432635qvj.116.1643228721307; 
	Wed, 26 Jan 2022 12:25:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJze1yjZvcppzNmXfLCG5XHVb07viUq7EOClOmQBQwEVKkpKq8oRDQQbE4c8SF/u6k0/KW6KM7KPuCi1JcmEQTs=
X-Received: by 2002:a05:6214:21e8:: with SMTP id
	p8mr432613qvj.116.1643228721051; 
	Wed, 26 Jan 2022 12:25:21 -0800 (PST)
MIME-Version: 1.0
References: <20220126150354.3644838-1-aahringo@redhat.com>
	<20220126200703.GZ4285@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20220126200703.GZ4285@paulmck-ThinkPad-P17-Gen-1>
From: Alexander Aring <aahringo@redhat.com>
Date: Wed, 26 Jan 2022 15:25:10 -0500
Message-ID: <CAK-6q+hzhndgEVLEO7m_Yu8ZEkwsQrBRZQpJdEvpK-iCCPG1LQ@mail.gmail.com>
To: paulmck@kernel.org
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, jiangshanlai@gmail.com,
	josh@joshtriplett.org, rostedt@goodmis.org, rcu@vger.kernel.org,
	mathieu.desnoyers@efficios.com
Subject: Re: [Cluster-devel] [PATCH] srcutree: use export for srcu_struct
	defined by DEFINE_STATIC_SRCU()
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

Hi,

On Wed, Jan 26, 2022 at 3:13 PM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Wed, Jan 26, 2022 at 10:03:54AM -0500, Alexander Aring wrote:
> > This patch fixes a sparse issue if DEFINE_STATIC_SRCU() of srcutree is
> > used by a module. Sparse will show:
> >
> > sparse: symbol '__srcu_struct_nodes_srcu' was not declared. Should it be static?
> >
> > The problem is here that the DEFINE_STATIC_SRCU() of srcutree uses
> > __DEFINE_SRCU() and define a non-static srcu_struct. This srcu_struct
> > will be exported by inserting it in a special module section
> > '__section("___srcu_struct_ptrs")'. During load/unloading srcutree runs
> > their init/cleanup functionality. It seems sparse does not understand
> > this connection. To avoid the sparse warning we make a prototype of the
> > exported srcu_struct with an export keyword. This way we tell the
> > that the srcu_struct might be used outside of the module.
> >
> > Signed-off-by: Alexander Aring <aahringo@redhat.com>
>
> Queued for further review and testing, thank you!!!
>
> As usual, I could not resist the urge to wordsmith a bit.  Could you
> please check below in case I messed something up?
>
>                                                         Thanx, Paul
>
> ------------------------------------------------------------------------
>
> commit fa92d727f94486195e12dc782fec17d103072101
> Author: Alexander Aring <aahringo@redhat.com>
> Date:   Wed Jan 26 10:03:54 2022 -0500
>
>     srcutree: Use export for srcu_struct defined by DEFINE_STATIC_SRCU()
>
>     If an srcu_struct structure defined by tree SRCU's DEFINE_STATIC_SRCU()
>     is used by a module, sparse will give the following diagnostic:
>
>     sparse: symbol '__srcu_struct_nodes_srcu' was not declared. Should it be static?
>
>     The problem is that a within-module DEFINE_STATIC_SRCU() must define
>     a non-static srcu_struct because it is exported by referencing it in a
>     special '__section("___srcu_struct_ptrs")'.  This reference is needed
>     so that module load and unloading can invoke init_srcu_struct() and
>     cleanup_srcu_struct(), respectively.  Unfortunately, sparse is unaware of
>     '__section("___srcu_struct_ptrs")', resulting in the above false-positive
>     diagnostic.  To avoid this false positive, this commit therefore creates
>     a prototype of the srcu_struct with an "extern" keyword.
>

perfect, thanks.

- Alex

