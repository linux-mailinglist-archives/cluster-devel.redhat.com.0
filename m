Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 314D7180F2
	for <lists+cluster-devel@lfdr.de>; Wed,  8 May 2019 22:22:45 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BD4155D61A;
	Wed,  8 May 2019 20:22:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 54F5662671;
	Wed,  8 May 2019 20:22:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B8C2718089CA;
	Wed,  8 May 2019 20:22:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x48KLdfN029882 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 8 May 2019 16:21:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 62ABF1001E69; Wed,  8 May 2019 20:21:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C37A1001E64
	for <cluster-devel@redhat.com>; Wed,  8 May 2019 20:21:37 +0000 (UTC)
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 34A12307B964
	for <cluster-devel@redhat.com>; Wed,  8 May 2019 20:21:34 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id f1so2711592lfl.6
	for <cluster-devel@redhat.com>; Wed, 08 May 2019 13:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YNifpvFw3YJp0jtYSAGlVH5MnjXwA/O9EoLNdihZ8Vk=;
	b=iGbILcjlPkScfe3+kL4rx1YCDG0rLGj0OCxrAUVBg3IlsAhRS9DY04SkRQIoFsxih3
	xRoNOXhZ1lu58a4WaA1997ouURMmXG/VMAMERNTrT4TJkEYC9+TcKMiCbpmJJW4U1Pp5
	G8lMUyOfOoY8+mEM0ARD57qYPiTTCm+xulpbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YNifpvFw3YJp0jtYSAGlVH5MnjXwA/O9EoLNdihZ8Vk=;
	b=QkmEdKuiFA6H7ZZS+p6+/kZermXD6JZo4BnVnETKxw1OxQPz1ZWquJsjpnhGMib9fl
	y+PeVV03XK6QOE7rTfM4bkA+8jMHOrueDmQ2U9vCrGEUWkIkKTQhwhFh0dD70V8GcF7w
	YmCid15tGnuEEcDtvjwt2CuJ4RG2taYI8qL9wY3NbnihETwNUlhT94CEPC2nQsvmUgYA
	DtUtc8rQ1rCaklmFOrh7kQuaMHEvCVHdimWFrQvayjGpD1ipRWrLGxYr1SAbP3r4ww5E
	mLuyDjtX1GY+yBe1HeMwaAyTiCMgtItfk7hj+Qm5IcTDZTjvOvucjbNi28CsLswe+GX8
	ZGvw==
X-Gm-Message-State: APjAAAUYS4dHNx9ArYVP6XOmiUZvfpLk1NwOE3a5JPH54Pk81RR0hmip
	edHAHN7PG4R/wIcHE0UgwQBUGXjLie8=
X-Google-Smtp-Source: APXvYqzK1bHqlu9gBgA5SGwUma1H3ddrjiPQV3SUeZzsYVpzQrxFVUa6P9haKMVc/S58ZbxRirCiQw==
X-Received: by 2002:a19:f243:: with SMTP id d3mr33157lfk.168.1557346892217;
	Wed, 08 May 2019 13:21:32 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com.
	[209.85.208.169]) by smtp.gmail.com with ESMTPSA id
	z17sm4091435lja.26.2019.05.08.13.21.30 for <cluster-devel@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 13:21:31 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id z5so23093lji.10
	for <cluster-devel@redhat.com>; Wed, 08 May 2019 13:21:30 -0700 (PDT)
X-Received: by 2002:a2e:801a:: with SMTP id j26mr12914689ljg.2.1557346890466; 
	Wed, 08 May 2019 13:21:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAHc6FU5Yd9EVju+kY8228n-Ccm7F2ZBRJUbesT-HYsy2YjKc_w@mail.gmail.com>
	<CAHk-=wj_L9d8P0Kmtb5f4wudm=KGZ5z0ijJ-NxTY-CcNcNDP5A@mail.gmail.com>
	<CAHk-=whbrADQrEezs=-t0QsKw-qaVU_2s2DqxLAkcczxc62SLQ@mail.gmail.com>
	<CAHc6FU40HucCUzx5k2obs8m6dXS08NmXBM-tFOq7fSbLduHiGw@mail.gmail.com>
In-Reply-To: <CAHc6FU40HucCUzx5k2obs8m6dXS08NmXBM-tFOq7fSbLduHiGw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 8 May 2019 13:21:14 -0700
X-Gmail-Original-Message-ID: <CAHk-=whqKCxGfh8RfR15Xz-pB1SuyX3cJRAo90=Bww4rNS6bqA@mail.gmail.com>
Message-ID: <CAHk-=whqKCxGfh8RfR15Xz-pB1SuyX3cJRAo90=Bww4rNS6bqA@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Wed, 08 May 2019 20:21:34 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Wed, 08 May 2019 20:21:34 +0000 (UTC) for IP:'209.85.167.66'
	DOMAIN:'mail-lf1-f66.google.com' HELO:'mail-lf1-f66.google.com'
	FROM:'torvalds@linuxfoundation.org' RCPT:''
X-RedHat-Spam-Score: -0.017  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,
	SPF_PASS) 209.85.167.66 mail-lf1-f66.google.com 209.85.167.66
	mail-lf1-f66.google.com <torvalds@linuxfoundation.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>, "Tobin C. Harding" <me@tobin.cc>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Wed, 08 May 2019 20:22:44 +0000 (UTC)

On Wed, May 8, 2019 at 1:17 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
>
> Would it make sense to describe how to deal with merge conflicts in
> Documentation/maintainer/pull-requests.rst to stop people from getting
> this wrong over and over again?

Probably. I do think it got written up at some point (lwn or something
like that), but it's possible it never got made into an actual
documentation file..

Anybody want to try to massage that email into the appropriate doc file?

              Linus

