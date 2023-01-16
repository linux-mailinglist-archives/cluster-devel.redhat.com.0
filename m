Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2E266BBD3
	for <lists+cluster-devel@lfdr.de>; Mon, 16 Jan 2023 11:36:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673865418;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iQgXhSSnahVI/6cPfM7zmrHrUxFmhWSNIB2K5LEGIc8=;
	b=NLvSAZ9QDCMZV4McJVY0xsT1ygrq8Eh+iYvPmK7tNzKqsowYlUvBsXrB7VtgM/ZhcnMUT1
	1UMIdw+JUW1h5aOc6f67UDVATW8ZH+5j8LdW/BGrxCjT5yFrCMsHSdeaxzFQ5q6Xc8bJcf
	YXAry+/W+BsHp4xezsrcjCxK330iRyo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-YZ6mb79IOJ6CMU3a-VB0qg-1; Mon, 16 Jan 2023 05:36:55 -0500
X-MC-Unique: YZ6mb79IOJ6CMU3a-VB0qg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D900029ABA05;
	Mon, 16 Jan 2023 10:36:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D309B40C6EC4;
	Mon, 16 Jan 2023 10:36:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8E886194658F;
	Mon, 16 Jan 2023 10:36:52 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6BC131946589 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 16 Jan 2023 10:36:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1DDA951FF; Mon, 16 Jan 2023 10:36:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 15E2539D6D
 for <cluster-devel@redhat.com>; Mon, 16 Jan 2023 10:36:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9E0F3C0F66A
 for <cluster-devel@redhat.com>; Mon, 16 Jan 2023 10:36:50 +0000 (UTC)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-208-PudEhS_GNuus1DZO3RQutg-1; Mon, 16 Jan 2023 05:36:49 -0500
X-MC-Unique: PudEhS_GNuus1DZO3RQutg-1
Received: by mail-qt1-f197.google.com with SMTP id
 f10-20020ac8134a000000b003b2dde42a4fso3314552qtj.4
 for <cluster-devel@redhat.com>; Mon, 16 Jan 2023 02:36:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iQgXhSSnahVI/6cPfM7zmrHrUxFmhWSNIB2K5LEGIc8=;
 b=pH8swxQTnnuLgtr37OJghW4ecMDO9gnGbIZzL6I3r2WXlJL6NR7isZnHAmIAv5vN/n
 jp7rEoxOHGNHCEUnbiBiCCEKF6gaW9o4MJ+kgiW86aI7awgwt/NUb1WCjAucaGxS1zDu
 5y0rhTM69JaiSFMiAZHTEq9FeOnzPmo7ywuN7I7m12fKNFGGwBNthW2MEjjult4iqeUC
 DkKSPfIkwSI6Mk83i9g0NqCVq7Kd1JF+BeGBZzcCubx+hGNRoNYFbsJhbvdMVcAwMDg0
 0ikUg/pAP3AvOYRm46O0SfmCv3frQJ7xSfGsRuwi2rbktKp4o84pkY+b10eyA4lz40m4
 UoXw==
X-Gm-Message-State: AFqh2koqL8hHS7EJuulUebiJah24pY4Y8ZvvKU2CsFJHPu/i9pR4f3yq
 UZrszAgCPa5uSbHtI3djx9/DMIgrcSV6FcQnJCdwuG7IUCnnoe+BxH8kZ+N258uCxa7e3+QKe2E
 8MHoEe5l9NRsNCPI+np8/Pw==
X-Received: by 2002:ac8:7409:0:b0:3b1:691f:3d7a with SMTP id
 p9-20020ac87409000000b003b1691f3d7amr23313416qtq.68.1673865409091; 
 Mon, 16 Jan 2023 02:36:49 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs0VkrfPKQ4UUBin8FMoZQeCk2usNX1/0sy2AfvlG/Xrr9rSjWFHCSJF4witURyCdfJ/r1fZA==
X-Received: by 2002:ac8:7409:0:b0:3b1:691f:3d7a with SMTP id
 p9-20020ac87409000000b003b1691f3d7amr23313403qtq.68.1673865408795; 
 Mon, 16 Jan 2023 02:36:48 -0800 (PST)
Received: from
 0.7.3.c.2.b.0.0.0.3.7.8.9.5.0.2.0.0.0.0.a.d.f.f.0.b.8.0.1.0.0.2.ip6.arpa
 (0.7.3.c.2.b.0.0.0.3.7.8.9.5.0.2.0.0.0.0.a.d.f.f.0.b.8.0.1.0.0.2.ip6.arpa.
 [2001:8b0:ffda:0:2059:8730:b2:c370])
 by smtp.gmail.com with ESMTPSA id
 l23-20020a37f917000000b006fc2b672950sm17904156qkj.37.2023.01.16.02.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 02:36:48 -0800 (PST)
Message-ID: <4ef0115691e1c70f55f85b33fb10642d5bb6f790.camel@redhat.com>
From: Steven Whitehouse <swhiteho@redhat.com>
To: Alexander Aring <aahringo@redhat.com>, teigland@redhat.com
Date: Mon, 16 Jan 2023 10:36:45 +0000
In-Reply-To: <20230113224357.2756856-1-aahringo@redhat.com>
References: <20230113224357.2756856-1-aahringo@redhat.com>
Organization: Red Hat UK Ltd
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCH dlm-tool] dlm_controld: better uevent
 filtering
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, 2023-01-13 at 17:43 -0500, Alexander Aring wrote:
> When I did test with dlm_locktorture module I got several log
> messages
> about:
>=20
> uevent message has 3 args: add@/module/dlm_locktorture
> uevent message has 3 args: remove@/module/dlm_locktorture
>=20
> which are not expected and not able to parse by dlm_controld
> process_uevent() function, because mismatch of argument counts.
> Debugging it more, I figured out that those uevents are for
> loading/unloading the dlm_locktorture module and there are uevents
> for
> loading and unloading modules which have nothing todo with dlm
> lockspace
> uevent handling.
>=20
> The current filter works as:
>=20
> if (!strstr(buf, "dlm"))
>=20
I think that is the problem. If you want to filter out all events
except those sent by the DLM module, then you need to look at the
variables sent along with the request. Otherwise whatever string you
look for here might appear in some other random request from a
different subsystem. The event variables are much easier to parse than
the actual event string...

See a similar example in decode_uevent(), etc here:

https://github.com/andyprice/gfs2-utils/blob/91c3e9a69ed70d3d522f5b47015da5=
e5868722ec/group/gfs_controld/main.c

There are probably nicer ways of doing that, than what I did there, but
it makes it is easier to get at the variables that are passed with the
notification, than to try and parse the first line of the response,

Steve.


> for matching the dlm joining/leaving uevent string which looks like:
>=20
> offline@/kernel/dlm/locktorture
>=20
> to avoid matching with other uevent which has somehow the string
> "dlm"
> in it, we switch to the match "/dlm/" which should match only to dlm
> uevent system events. Uevent uses itself '/' as a separator in the
> hope
> that uevents cannot put a '/' as application data for an event.
> ---
> =C2=A0dlm_controld/main.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/dlm_controld/main.c b/dlm_controld/main.c
> index 7cf6348e..40689c5c 100644
> --- a/dlm_controld/main.c
> +++ b/dlm_controld/main.c
> @@ -704,7 +704,7 @@ static void process_uevent(int ci)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!strstr(buf, "dlm"))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!strstr(buf, "/dlm/"))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0log_debug("uevent: %s", b=
uf);

