Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F264BA26A
	for <lists+cluster-devel@lfdr.de>; Thu, 17 Feb 2022 15:05:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645106725;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=yeK0f5IcwVacTRwN3ARkJEykS/zfK8rqQkJwEbt8i/c=;
	b=JCIGUYEYu1HogY3vuSJgZM+Cd3y9pUvvnyzwp9lQhFSLvNfHfE6Z5vFR7fOiYWWaUDatPV
	TfAQm9Alyv9zGdFidVdl76uyyAEH6TbDFMHHniAniY5bLNDp+X4wMzAwyKJijJ76ge31gf
	BCxw+sEauYTHODenlNErlyaDOJs7HYg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-9ahivhdSP0SLnPsNPp1V5w-1; Thu, 17 Feb 2022 09:05:20 -0500
X-MC-Unique: 9ahivhdSP0SLnPsNPp1V5w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70FE7801B24;
	Thu, 17 Feb 2022 14:05:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F2DF10900AA;
	Thu, 17 Feb 2022 14:05:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 74E464BB7C;
	Thu, 17 Feb 2022 14:05:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21HE3SuQ007914 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 17 Feb 2022 09:03:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DC33D2166B2D; Thu, 17 Feb 2022 14:03:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7C432166B18
	for <cluster-devel@redhat.com>; Thu, 17 Feb 2022 14:03:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFD5880088A
	for <cluster-devel@redhat.com>; Thu, 17 Feb 2022 14:03:24 +0000 (UTC)
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
	[209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-646-1ppBBJhiNviyWoodicMGFA-1; Thu, 17 Feb 2022 09:03:23 -0500
X-MC-Unique: 1ppBBJhiNviyWoodicMGFA-1
Received: by mail-qv1-f72.google.com with SMTP id
	e9-20020a0cf749000000b0042bf697ff6bso5372075qvo.5
	for <cluster-devel@redhat.com>; Thu, 17 Feb 2022 06:03:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yeK0f5IcwVacTRwN3ARkJEykS/zfK8rqQkJwEbt8i/c=;
	b=WvS6B2+mhPvk+6W7oXXB+k0MvWCxiWUHKKdfW/q9r6EAsjPjZy949tM+RKWE7q+2+0
	2dSYenptzm/xgzP/CTh7Kpwkb2OpHnParapiWSAAWhjD588jgpMXnG1gBnuzQjH0pb8U
	sref6wGDll3y1YP5BBrfUga9QCU2bt4lTAir0hG7/a3qUK9YG/uzYnXlWuDPzBJJX2hb
	Jz4ZSd5qNyUgeT+DsAdNjLQzfOaeI3J80NGAxBW9ERfKKVbhvOFVX3RYNVHAL/UQKDJe
	/YuBN6Z2bdrJ84u7SXs9oPnkkPbAgVjRaUekSB0kRXRPOKQ4yitaKU5ojNKA8wypJ9is
	ds6A==
X-Gm-Message-State: AOAM530YqpGRlAlyNyi5K6ar+YoMYgtx6jRti5c7aORQKswkWs+vDW2h
	7oUiLkNK8ICFf60hw3BRelc4zM3FBaFGQt0Ta7/m+EXn1/evCt4eUUfDeOlB9+iyBc7OlAC3Uss
	/XwUkQtAs3aYzoQqClb/viL1EIAaCiDXZRkQyKA==
X-Received: by 2002:ac8:5c49:0:b0:2d5:de5f:ebb7 with SMTP id
	j9-20020ac85c49000000b002d5de5febb7mr2390058qtj.339.1645106602617;
	Thu, 17 Feb 2022 06:03:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5SG/u63ZLIRogCQXW7YGI5sqP69uWwLYGqD7AYc6Bbyb8H2zCXCBrf8xCREDLQcQ6R+sAJmQBDBRgp6iOxu8=
X-Received: by 2002:ac8:5c49:0:b0:2d5:de5f:ebb7 with SMTP id
	j9-20020ac85c49000000b002d5de5febb7mr2390036qtj.339.1645106602430;
	Thu, 17 Feb 2022 06:03:22 -0800 (PST)
MIME-Version: 1.0
References: <20220216155307.2994688-1-aahringo@redhat.com>
	<20220216155307.2994688-2-aahringo@redhat.com>
	<CAHc6FU77jwdsDv_FGCFxrUVn_DOEqGrKEkB8c7N2pAF_j5Xo+A@mail.gmail.com>
	<CAK-6q+id1tmHL2GXBqOsJh53pbyH5rdTAgLeXdqUj4D6kZvkow@mail.gmail.com>
	<CAHc6FU4yypWqE+BZx4AstMYHkzoSDV5jVndYY7jYk7L1v20isg@mail.gmail.com>
	<20220217004142.551299-1-agruenba@redhat.com>
In-Reply-To: <20220217004142.551299-1-agruenba@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Thu, 17 Feb 2022 09:03:11 -0500
Message-ID: <CAK-6q+jKKr3hx29QMmz9jgoBNhs0NiyCEC8czYvg55dDr6Kkjw@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH dlm/next 1/4] fs: dlm: replace sanity
 checks with WARN_ON
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wed, Feb 16, 2022 at 7:41 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
>
> There's also an unnecessary INIT_LIST_HEAD() in send_op().
>

please send a patch in a form which makes it easy to apply. Also
please explain exactly why an "INIT_LIST_HEAD()" is not needed here
rather than just stating that the init isn't needed.

Thanks.

- Alex

