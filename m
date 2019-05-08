Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACCC18172
	for <lists+cluster-devel@lfdr.de>; Wed,  8 May 2019 23:06:18 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CE4FE308793F;
	Wed,  8 May 2019 21:06:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F2662CE64;
	Wed,  8 May 2019 21:06:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 16D7D18089C8;
	Wed,  8 May 2019 21:06:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x48L5wef007099 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 8 May 2019 17:05:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B9F4E5D9D1; Wed,  8 May 2019 21:05:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B52575DD9B
	for <cluster-devel@redhat.com>; Wed,  8 May 2019 21:05:56 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A23913083391
	for <cluster-devel@redhat.com>; Wed,  8 May 2019 21:05:55 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id q10so136266ljc.6
	for <cluster-devel@redhat.com>; Wed, 08 May 2019 14:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Fckl0xjweeVSgmV6ZhbixKk1mxFtiIYGjnNtVdcmVxo=;
	b=Pp2t2GlyiZSXovwnh9PFrn4iYBJ/vbeGKAbfaCTmcGmXDPVHx18nUq63X85sD1beaH
	vac1zYT1UIe1PABtweZBtUEFhs5plA3qmlj8jeg9kFjNFnXE7BYze6WdSAokj1y/1eVq
	vphRbjzCRE7ZQdfdrFUZPXy5vbAMZbWAt9HWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Fckl0xjweeVSgmV6ZhbixKk1mxFtiIYGjnNtVdcmVxo=;
	b=UxHH1TnG3YXNSmqdHr5XCeKz+4Ve6z+8gy13ZBlTBmklO8pyl0lnR0ukzLo+T+JVBq
	sCIgFrj/1t4EMj6vQcMQb6YMUW1PX1ksQLfGLbryb9C1JI4MtefTAM1v1+jfsjcgC3le
	2ZVCiiO783Li7hCm4MHSgmQcKXS8qsZQSqLDc+MqmNR2qPfYW48ZMFiZKWicO4NZ3wX6
	ehiaHAxx+Pq3eeK8FaOGkY98H9KoW966AMRPFxAKYxe9C9EofvyV0e0lGCS1itYOHmCY
	vxybRt9l0dqZrpsFpNxq2DMF8XHP9ErH/jyKfya0Up++kqrm1F/Nya+xXk6EuHV6a1Jw
	b8fw==
X-Gm-Message-State: APjAAAVqZf0kN6VTwv+NWJ1LVb/IC60DAvHS+L8xq28XFJSEPkJfdG3f
	sUO3F+KwZqYvn8ceUU5yx/OYdHNBXSw=
X-Google-Smtp-Source: APXvYqxpIHZJcAx5y/q9XpIMEKmMDrzFXAqOR7PxDFxXpiVOWRUZrExJwqwkLfN73ro+oVnp1GROew==
X-Received: by 2002:a2e:9002:: with SMTP id h2mr7086445ljg.164.1557349553351; 
	Wed, 08 May 2019 14:05:53 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com.
	[209.85.208.173]) by smtp.gmail.com with ESMTPSA id
	k87sm2356349ljb.70.2019.05.08.14.05.51 for <cluster-devel@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 14:05:52 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id z5so117852lji.10
	for <cluster-devel@redhat.com>; Wed, 08 May 2019 14:05:51 -0700 (PDT)
X-Received: by 2002:a2e:3e0e:: with SMTP id l14mr22158854lja.125.1557349551465;
	Wed, 08 May 2019 14:05:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAHc6FU5Yd9EVju+kY8228n-Ccm7F2ZBRJUbesT-HYsy2YjKc_w@mail.gmail.com>
	<CAHk-=wj_L9d8P0Kmtb5f4wudm=KGZ5z0ijJ-NxTY-CcNcNDP5A@mail.gmail.com>
	<CAHk-=whbrADQrEezs=-t0QsKw-qaVU_2s2DqxLAkcczxc62SLQ@mail.gmail.com>
	<CAHc6FU40HucCUzx5k2obs8m6dXS08NmXBM-tFOq7fSbLduHiGw@mail.gmail.com>
	<20190508145818.6a53dff5@lwn.net>
In-Reply-To: <20190508145818.6a53dff5@lwn.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 8 May 2019 14:05:35 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiUMj0nwj_ee59J4yLnbnR_UfMeRx4agijSc7DKJADoPw@mail.gmail.com>
Message-ID: <CAHk-=wiUMj0nwj_ee59J4yLnbnR_UfMeRx4agijSc7DKJADoPw@mail.gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Wed, 08 May 2019 21:05:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Wed, 08 May 2019 21:05:55 +0000 (UTC) for IP:'209.85.208.194'
	DOMAIN:'mail-lj1-f194.google.com' HELO:'mail-lj1-f194.google.com'
	FROM:'torvalds@linuxfoundation.org' RCPT:''
X-RedHat-Spam-Score: -0.017  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,
	SPF_PASS) 209.85.208.194 mail-lj1-f194.google.com 209.85.208.194
	mail-lj1-f194.google.com <torvalds@linuxfoundation.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	Dan Williams <dan.j.williams@intel.com>, "Tobin C. Harding" <me@tobin.cc>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Cluster-devel] GFS2: Pull Request
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Wed, 08 May 2019 21:06:17 +0000 (UTC)

On Wed, May 8, 2019 at 1:58 PM Jonathan Corbet <corbet@lwn.net> wrote:
>
> I think this certainly belongs in the maintainer manual, but probably not
> in pull-requests.rst.  There are a lot of things about repository
> management that seem to trip up even experienced maintainers; pre-pull
> merges is just one of those.  I would love to see a proper guide on when
> and how to do merges in general.

We had another pull request issue today, about a situation that I
definitely know you've written about in the past, because I linked to
lwn in my email:

   https://lore.kernel.org/lkml/CAHk-=wiKoePP_9CM0fn_Vv1bYom7iB5N=ULaLLz7yOST3K+k5g@mail.gmail.com/

and while I suspect people don't actually read documentation
(_particularly_ maintainers that have already been around for a long
time but still do this), maybe that part could be in the same
documentation?

                 Linus

