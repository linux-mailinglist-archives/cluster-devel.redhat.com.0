Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 353532D9D3F
	for <lists+cluster-devel@lfdr.de>; Mon, 14 Dec 2020 18:09:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607965765;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=6QlYH/iXlskFtsPfz92SXd6iy5OCFgebpslV/QkHKUs=;
	b=JSL4a+ASpJItuD1/5SZNYOeiFn4vXnVvSBdTfYChp1SBZztrFhS33y4K5A/+SDL//ojyMa
	y3ZNsLGhOifj3gHFWlFOjhVPk4VQPK43TOzplTS4yz77WvrcsPkwqY6nVNsV/4pIk9gqpY
	rH6Dj0MzXqZuDXdwfIvZTXxIhwrOEGw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-tBqXTm2MMIymuggUFhZQ9g-1; Mon, 14 Dec 2020 12:09:23 -0500
X-MC-Unique: tBqXTm2MMIymuggUFhZQ9g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83D1E800D62;
	Mon, 14 Dec 2020 17:09:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31BB960BE2;
	Mon, 14 Dec 2020 17:09:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 492251809C9F;
	Mon, 14 Dec 2020 17:09:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BEH9Aiu005836 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 14 Dec 2020 12:09:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4CEB7110FC07; Mon, 14 Dec 2020 17:09:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 48AD8110FC05
	for <cluster-devel@redhat.com>; Mon, 14 Dec 2020 17:09:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6DB8101A53F
	for <cluster-devel@redhat.com>; Mon, 14 Dec 2020 17:09:07 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
	[209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-7-ILHGX8etPgC0gsr7kHItNw-1; Mon, 14 Dec 2020 12:09:06 -0500
X-MC-Unique: ILHGX8etPgC0gsr7kHItNw-1
Received: by mail-wm1-f69.google.com with SMTP id l5so3709507wmi.4
	for <cluster-devel@redhat.com>; Mon, 14 Dec 2020 09:09:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6QlYH/iXlskFtsPfz92SXd6iy5OCFgebpslV/QkHKUs=;
	b=mcw+hKTE0JHJAX1JBwysDXyQjS91ejh619r4ktfZQpZyG8MBuRM2ca6yEzDmi0FL5o
	dHaeAx2UszY2AdvAqSEMGN6p5g+G9ITjFv0DkVM4JH2DNz0F68ZJ1QCkcKMefl+BKGA1
	woo7rOF7zUwYQD8eufmDpEIiRUb+n8aPvhPPhaklJBKjiv2t8Lp71ot6wQ+K2BaXFz1t
	iU4DJT2QCT9HQsgqzZydOLsQdkBhunKXNpdEBd1gq7yaDSiS2vkHe6W0NqiCfSxRmJMU
	Y2V8qG7WbCP4g/VI2qNFCtS1+V0TnEfhkALiuSxWmfU03izp0fEiV2xt7iWOraWbyFxK
	1T+w==
X-Gm-Message-State: AOAM530xdomP1eA4fjOnSd0MJxHzC8VnmPrfve6WkLUeBHKb9aBednAh
	dc/abbPoaQfBNRpOWnXncsa9fnR/fVEAhBOkW56KYyi5zSV035F9NnDWCZYscpprXw+jk/wjhiU
	E5qOU0ZKrwBj998aFcKzLzIi/XcB7J0OVFJoMQQ==
X-Received: by 2002:a1c:4c14:: with SMTP id z20mr29236354wmf.149.1607965745173;
	Mon, 14 Dec 2020 09:09:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyT2R/kfWvmLPwaSE0Flep75ChhsOqXoJt97W5CApXQyrTvBaSnLKclZJx7EGfR+T+iwCKYwAzp25snvKxgRmk=
X-Received: by 2002:a1c:4c14:: with SMTP id z20mr29236343wmf.149.1607965745025;
	Mon, 14 Dec 2020 09:09:05 -0800 (PST)
MIME-Version: 1.0
References: <20201214085442.45467-1-agruenba@redhat.com>
	<20201214085442.45467-8-agruenba@redhat.com>
	<921985709.35517993.1607954538874.JavaMail.zimbra@redhat.com>
	<fb8e0eab-75af-105e-8059-0d7c053f9477@redhat.com>
In-Reply-To: <fb8e0eab-75af-105e-8059-0d7c053f9477@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 14 Dec 2020 18:08:53 +0100
Message-ID: <CAHc6FU6dYMC+uuUAmoaeXrvSNSgjNShSc6QHGc2ntXayGmupXg@mail.gmail.com>
To: Steven Whitehouse <swhiteho@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH 07/12] gfs2: Get rid of on-stack
	transactions
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 14, 2020 at 3:06 PM Steven Whitehouse <swhiteho@redhat.com> wrote:
> On 14/12/2020 14:02, Bob Peterson wrote:
> > Hi,
> >
> > ----- Original Message -----
> >> +    ret = __gfs2_trans_begin(sdp, 0, revokes, GFP_NOFS | __GFP_NOFAIL);
> > The addition of __GFP_NOFAIL means that this operation can now block.
> > Looking at the code, I don't think it will be a problem because it can
> > already block in the log_flush operations that precede it, but it
> > makes me nervous. Obviously, we need to test this really well.
> >
> > Bob
> >
> Not sure of the context here exactly, but why are we adding an instance
> of __GFP_NOFAIL? There is already a return code there so that we can
> fail in that case if required,

__GFS_NOFAIL is used in {inode,rgrp}_go_sync -> gfs2_ail_empty_gl ->
__gfs2_trans_begin, and there isn't any reasonable way to react an
-ENOMEM error but to repeat the allocation.

Thanks,
Andreas

