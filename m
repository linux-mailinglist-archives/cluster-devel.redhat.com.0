Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6992217F83
	for <lists+cluster-devel@lfdr.de>; Wed,  8 May 2019 20:08:25 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9C01C300502A;
	Wed,  8 May 2019 18:08:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E085C60C93;
	Wed,  8 May 2019 18:08:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AB65941F58;
	Wed,  8 May 2019 18:08:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x48I70J7005329 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 8 May 2019 14:07:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5E51762699; Wed,  8 May 2019 18:07:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 58F4262676
	for <cluster-devel@redhat.com>; Wed,  8 May 2019 18:06:57 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8C0D3308620F
	for <cluster-devel@redhat.com>; Wed,  8 May 2019 18:06:56 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id s7so12869441ljh.1
	for <cluster-devel@redhat.com>; Wed, 08 May 2019 11:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=StoLT6n6x/EKa+hOFwd7tcX3z/oXXRB4YXDAJE+FJf8=;
	b=iG3v/2Xz0X6FPhx3ghsSHLQ7s2hwg6UZbig1Km6XbMOm/asgx9ExfslkY8xiL4OWXn
	nl5Hn5H6q6hqen8+G8rBXsn2EVgxIWl/sg6iseQ1OgevPMnlviQYImLiwUFaHqS77uoK
	DmlKY4PWyFEatSNxK4wxrdFlUyPKxAyudc2EY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=StoLT6n6x/EKa+hOFwd7tcX3z/oXXRB4YXDAJE+FJf8=;
	b=DZzASLe1RxOcVp92/plpwHhD9ansp1TpQ2pu3f7PZTR2lwf8Hs0slk6H4CnDmLwgRF
	X05dV+pAKkPW7uo6F7L4p5W3y5VfN91OrVhceuu6qNWegna70wAx+oex69p9yIszQE4M
	oArh6X9QrAmziuqYoLt5M0eSOWx7W8+g+JghWRYtI9wcfLVElRF6P70ZgYiJSwZCb6O/
	NO9gkob0ekOqkXs7thLherbG90YlSOKi9S7msbf9Eu1DN8jWBKBRIbPK15Gh0T/z/L17
	hFPQ4n83IjwrSsOmXBcJwt0DEbvxuxLMpRy45NOc+lqTiTJ//DRsqeuCZF2NpxT9D4TF
	RuYg==
X-Gm-Message-State: APjAAAW2LCXCANGMwLIVo3ejZCqEZ7N7KjJXbqe6zcznH0u9Dr750o+c
	MpjNU3ZVuzpVqu0ypTQLVDb/4pFM7XY=
X-Google-Smtp-Source: APXvYqzNW4u4SzYwoPEvd3pRfbT/XjvUwRWoPvB1CSie2N4H5MYFEOMlJwpkpeg7rK1z5CCCZ/rSUQ==
X-Received: by 2002:a2e:9252:: with SMTP id v18mr12714939ljg.119.1557338814680;
	Wed, 08 May 2019 11:06:54 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com.
	[209.85.208.173])
	by smtp.gmail.com with ESMTPSA id q7sm4485172lfc.0.2019.05.08.11.06.53
	for <cluster-devel@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 11:06:53 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id e13so3707355ljl.11
	for <cluster-devel@redhat.com>; Wed, 08 May 2019 11:06:53 -0700 (PDT)
X-Received: by 2002:a2e:801a:: with SMTP id j26mr12588727ljg.2.1557338813410; 
	Wed, 08 May 2019 11:06:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAHc6FU5Yd9EVju+kY8228n-Ccm7F2ZBRJUbesT-HYsy2YjKc_w@mail.gmail.com>
	<CAHk-=wj_L9d8P0Kmtb5f4wudm=KGZ5z0ijJ-NxTY-CcNcNDP5A@mail.gmail.com>
In-Reply-To: <CAHk-=wj_L9d8P0Kmtb5f4wudm=KGZ5z0ijJ-NxTY-CcNcNDP5A@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 8 May 2019 11:06:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=whbrADQrEezs=-t0QsKw-qaVU_2s2DqxLAkcczxc62SLQ@mail.gmail.com>
Message-ID: <CAHk-=whbrADQrEezs=-t0QsKw-qaVU_2s2DqxLAkcczxc62SLQ@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Wed, 08 May 2019 18:06:56 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Wed, 08 May 2019 18:06:56 +0000 (UTC) for IP:'209.85.208.194'
	DOMAIN:'mail-lj1-f194.google.com' HELO:'mail-lj1-f194.google.com'
	FROM:'torvalds@linuxfoundation.org' RCPT:''
X-RedHat-Spam-Score: -0.017  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,
	SPF_PASS) 209.85.208.194 mail-lj1-f194.google.com 209.85.208.194
	mail-lj1-f194.google.com <torvalds@linuxfoundation.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Wed, 08 May 2019 18:08:24 +0000 (UTC)

On Wed, May 8, 2019 at 10:55 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> See what I'm saying? You would ask me to pull the un-merged state, but
> then say "I noticed a few merge conflicts when I did my test merge,
> and this is what I did" kind of aside.

Side note: this is more important if you know of a merge issue that
doesn't cause a conflict, and that I won't see in my simple build
tests.

For example, in this case, the merge issue doesn't cause a conflict
(because it's a totally new user of bio_for_each_segment_all() and the
syntax changed in another branch), but I see it trivially when I do a
test build, since the compiler spews out lots of warnings, and so I
can trivially fix it up (and you _mentioning_ the issue gives me the
heads up that you knew about it and what it's all about).

But if it's other architectures, or only happens under special config
options etc, I might not have seen the merge issue at all. And then
it's really good if the maintainer talks about it and shows that yes,
the maintainer knows what he's doing.

Now I'm in the situation where I have actually done the merge the way
I *like* doing them, and without your superfluous merge commit. But if
I use my merge, I'll lose the signature from your tag, because you
signed *your* merge that I didn't actually want to use at all.

See? Your "helpful" merge actually caused me extra work, and made me
have to pick one of two *worse* situations than if you had just tagged
your own development tree. Either my tree has a extra pointless merge
commit, or my tree lacks your signature on your work.

I'll just undo my pull, and delay it all in the hope that you'll just
send me a new signed tag of the non-merged state.

                   Linus

