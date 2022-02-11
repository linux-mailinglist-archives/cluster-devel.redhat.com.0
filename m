Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 285954B2DFB
	for <lists+cluster-devel@lfdr.de>; Fri, 11 Feb 2022 20:48:24 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-rvTNOVQlOUCPcV48sdBcfQ-1; Fri, 11 Feb 2022 14:48:20 -0500
X-MC-Unique: rvTNOVQlOUCPcV48sdBcfQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCCF986A8A0;
	Fri, 11 Feb 2022 19:48:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0C7346975;
	Fri, 11 Feb 2022 19:48:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 07EB54BB7C;
	Fri, 11 Feb 2022 19:48:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
	[10.11.54.8])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21BJm6K3016680 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 11 Feb 2022 14:48:06 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AA6BBC52782; Fri, 11 Feb 2022 19:48:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A6D80C23DC3
	for <cluster-devel@redhat.com>; Fri, 11 Feb 2022 19:48:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64FFA802812
	for <cluster-devel@redhat.com>; Fri, 11 Feb 2022 19:47:53 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
	[209.85.208.41]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-657-_ieL6cN0PDKo1G2dGKJbwg-1; Fri, 11 Feb 2022 14:47:41 -0500
X-MC-Unique: _ieL6cN0PDKo1G2dGKJbwg-1
Received: by mail-ed1-f41.google.com with SMTP id f17so18122179edd.2
	for <cluster-devel@redhat.com>; Fri, 11 Feb 2022 11:47:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GyW2RvUVThJw06bUbJiNTwFzC14YMAiwBkIxJA9HVqA=;
	b=sM8hBQU3ray3+OyyJPdvN9Lvz8iM4xQ3wWQvYpZ3ct6nUeZ8g9eqpioe6xkVtpZkGM
	/r0euXj9GdRJZ0PrR0NfniCn5+nvqxI7x3G950fRnTtkMVx2YXL6ZjOmJccVVKL9a10/
	ELGoDBbDTQMvUXyAkbD7gTqplR7CroK616mDjsarzkmuuUCNVdHY5P4EQtE2ZXPztC4Q
	4Ms1+4cLkDX3F0FImDw/vK92zLuW/Uuxn52dFOwkz64eyIAFRMoJbWwMKr9s9OXOMbDS
	7Uydm0060UTSQ70+6U43zclTkL/XRYGjo807T9/plVlemSdXY9HWdHCZt4czarU9U79b
	qWyw==
X-Gm-Message-State: AOAM531e4NX1H/hobRIc9H9uz2bnBT9th8GmG3Uw6c+KR2ZW7prmnUMj
	RXY8cPnAOKgtT7coXR50C9GdQ/hJ0PB7UsU2oeU=
X-Google-Smtp-Source: ABdhPJyzJUHKiBr2N6eDZwnSdHdZcJOTNH9tgtl+40I4buyQ23hR/O/J+PZBSD2V8UFGba4aV3dtYw==
X-Received: by 2002:a05:6402:2683:: with SMTP id
	w3mr3651125edd.405.1644608860485; 
	Fri, 11 Feb 2022 11:47:40 -0800 (PST)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com.
	[209.85.221.45]) by smtp.gmail.com with ESMTPSA id
	v26sm5783385ejr.15.2022.02.11.11.47.39 for <cluster-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 11 Feb 2022 11:47:39 -0800 (PST)
Received: by mail-wr1-f45.google.com with SMTP id d27so13169561wrb.5
	for <cluster-devel@redhat.com>; Fri, 11 Feb 2022 11:47:39 -0800 (PST)
X-Received: by 2002:a5d:590d:: with SMTP id v13mr2505912wrd.274.1644608859573; 
	Fri, 11 Feb 2022 11:47:39 -0800 (PST)
MIME-Version: 1.0
References: <20220211170522.348999-1-agruenba@redhat.com>
In-Reply-To: <20220211170522.348999-1-agruenba@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 11 Feb 2022 11:47:23 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgURPnzwmWtgT-WSrpfFX9_wx_ZsY1XWp1MehrUuBuNiQ@mail.gmail.com>
Message-ID: <CAHk-=wgURPnzwmWtgT-WSrpfFX9_wx_ZsY1XWp1MehrUuBuNiQ@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Cluster-devel] [GIT PULL] gfs2 fixes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 11, 2022 at 9:05 AM Andreas Gruenbacher <agruenba@redhat.com> wrote:
>
> * Revert debug commit that causes unexpected data corruption.

Well, apparently not just unexpected, but unexplained too.

That's a bit worrisome. It sounds like the corruption cause is still
there, just hidden by the lack of __cond_resched()?

                Linus

