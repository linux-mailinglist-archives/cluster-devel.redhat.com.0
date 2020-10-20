Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 677B5294550
	for <lists+cluster-devel@lfdr.de>; Wed, 21 Oct 2020 01:04:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603235078;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=xo5NGo5E9fgFiTm1n5un7TgSbcfrob4Nt5pXutr4hqI=;
	b=GI2Z2U37bwznni0vksp3PgJhcPbSxIThGwWy4eOtDLjms3qtHgB3Fb3fsEAaljYaxl5aQk
	XUMkcSP5azn9kO69lb1+L1AnkUQqcn6paoc7V3gqjrZ7WgEav6bEkhblbmfACLyy6lijPB
	dQfaGmFx0mudBjbdQG/xbpLjpC05XJU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-W2DGB78gNYC8C-yeeFQW7g-1; Tue, 20 Oct 2020 19:04:36 -0400
X-MC-Unique: W2DGB78gNYC8C-yeeFQW7g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03FC91006C8F;
	Tue, 20 Oct 2020 23:04:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 057AF55763;
	Tue, 20 Oct 2020 23:04:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6A5741800FF5;
	Tue, 20 Oct 2020 23:04:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09KN4Rut015973 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 20 Oct 2020 19:04:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9D55E1014509; Tue, 20 Oct 2020 23:04:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 99EC31009BAE
	for <cluster-devel@redhat.com>; Tue, 20 Oct 2020 23:04:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 761BC800296
	for <cluster-devel@redhat.com>; Tue, 20 Oct 2020 23:04:25 +0000 (UTC)
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
	[209.85.166.199]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-446-fK_RotEwMYSUIRBueLMLHA-1; Tue, 20 Oct 2020 19:04:23 -0400
X-MC-Unique: fK_RotEwMYSUIRBueLMLHA-1
Received: by mail-il1-f199.google.com with SMTP id e3so54596ilq.18
	for <cluster-devel@redhat.com>; Tue, 20 Oct 2020 16:04:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xo5NGo5E9fgFiTm1n5un7TgSbcfrob4Nt5pXutr4hqI=;
	b=IKrJlyWvMM76NeP6hBNldV4kyZVzjSj6t3hY1BQPm/JxYUOBIUiAHVi07GOo3siPMK
	eDvPR+BLTMItCoy8rXH/1cJ78dugWS6JZY7Xr8glEZpm4JqeYC/NpSQtRFIbQyYf/B/R
	SDdzRkJZ9KQUy9zcb9iVJjCbwlxNM7qymzzR6kkVlSktf0+5Gso/ehuAuY+8w2OQYkXx
	OO7+CbDiRdRiRhCZCfAFW4PSZBhTXUP0hjWf2+l2qp9SZbgo3wRMkBQq0KX9luXpchod
	h4+BQ87y3xUW8NrlzFtze3uW0nD8wwWxFSNo6d0RKVOcV/YQg36tX/6+SkNJMaPaa2Qi
	FYFA==
X-Gm-Message-State: AOAM530DZJ5OPm+2gCYLSJ0xcbu8N0OEhV/q0y9EP1wKbcWDecOcB7Yg
	mzw7iVIj6Ix+zXtZVeEFzsBTsc9MMcDwtaqBbani6zQb9XprVGw4pQfFv+HwMTJRYV2NqIvwzOI
	ECiVT8KjEsNCEcuq9ljWY7YQJ7MrmgcMWS1D5zA==
X-Received: by 2002:a92:ba14:: with SMTP id o20mr235630ili.76.1603235062552;
	Tue, 20 Oct 2020 16:04:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuv+GPo2cqVTaGPuWAMvDzaoIgKENGF/knphXVaDAsKk433nSw7ProM7J4HKenjqWOFVHo1gizeR1nWZC2jfc=
X-Received: by 2002:a92:ba14:: with SMTP id o20mr235618ili.76.1603235062266;
	Tue, 20 Oct 2020 16:04:22 -0700 (PDT)
MIME-Version: 1.0
References: <20201020210957.1009638-1-aahringo@redhat.com>
	<20201020210957.1009638-4-aahringo@redhat.com>
In-Reply-To: <20201020210957.1009638-4-aahringo@redhat.com>
From: Alexander Ahring Oder Aring <aahringo@redhat.com>
Date: Tue, 20 Oct 2020 19:04:11 -0400
Message-ID: <CAK-6q+iH=KT36Vtz2zxetXp36ossi-vbn-teKMVaD86---Rpkw@mail.gmail.com>
To: David Teigland <teigland@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH dlm/next 3/3] fs: dlm: check on existing
 node address
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, Oct 20, 2020 at 5:10 PM Alexander Aring <aahringo@redhat.com> wrote:
>
> This patch checks if we add twice the same address to a per node address
> array. This should never be the case and we report -EEXIST to the user
> space.
>
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/dlm/lowcomms.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
> index c23d794e82910..0dc651676dfa1 100644
> --- a/fs/dlm/lowcomms.c
> +++ b/fs/dlm/lowcomms.c
> @@ -370,10 +370,28 @@ static int addr_to_nodeid(struct sockaddr_storage *addr, int *nodeid)
>         return rv;
>  }
>
> +static bool dlm_lowcomms_na_has_addr(const struct dlm_node_addr *na,
> +                                    const struct sockaddr_storage *addr)
> +{
> +       int i;
> +
> +       spin_lock(&dlm_node_addrs_spin);
> +       for (i = 0; i < na->addr_count; i++) {
> +               if (addr_compare(na->addr[i], addr)) {
> +                       spin_unlock(&dlm_node_addrs_spin);
> +                       return true;
> +               }
> +       }
> +       spin_unlock(&dlm_node_addrs_spin);

grml, this lock is already held when calling that function, I need to
remove the lock and make some comment that this lock needs to be held
when the user calls it.

Sorry, I will send a v2.

- Alex

