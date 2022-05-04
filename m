Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B6251ABB6
	for <lists+cluster-devel@lfdr.de>; Wed,  4 May 2022 19:52:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1651686774;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=yf7BR3WltEqwAzcMwH0wKy6tL9PI+XUug92MYo/xJjM=;
	b=KXDD/7BADMnm+qBlAyt8e1TXzjKfv8zFnahDdEi09ApauUy9Lemslt8af8oXV4LnJEbtUr
	wHMlMJwL+HExI19zamB1/jjsa4c4BSKjTLBeTohEZT+09/B/NqoaJqvSU3QkIJvIgAll3y
	pEBSTm0SB36ZREFiBvN6Yaj7WRxQBjU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-504-v8GfquXDPF-Eyl4x2XPv5g-1; Wed, 04 May 2022 13:52:49 -0400
X-MC-Unique: v8GfquXDPF-Eyl4x2XPv5g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B43EB801E80;
	Wed,  4 May 2022 17:52:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CEB7D176C3;
	Wed,  4 May 2022 17:52:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E312B1947048;
	Wed,  4 May 2022 17:52:45 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4EBC11947043 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  4 May 2022 17:52:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2A57640D1B9F; Wed,  4 May 2022 17:52:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 262F84010E24
 for <cluster-devel@redhat.com>; Wed,  4 May 2022 17:52:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0BA04395AFEF
 for <cluster-devel@redhat.com>; Wed,  4 May 2022 17:52:45 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-Nj3aCwleMl-al8Pp4EUOUQ-1; Wed, 04 May 2022 13:52:41 -0400
X-MC-Unique: Nj3aCwleMl-al8Pp4EUOUQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 y13-20020adfc7cd000000b0020ac7c7bf2eso612591wrg.9
 for <cluster-devel@redhat.com>; Wed, 04 May 2022 10:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yf7BR3WltEqwAzcMwH0wKy6tL9PI+XUug92MYo/xJjM=;
 b=gyB0nWQVVB/Zq3hNdJLmnCebyaey2vkH0rwCyI+uk7i7RmvJ0RTtiQ1hI6/AU/FC3z
 I+uFsXVCvExVsp6o+1LWN3ToFknCruWHjBvjGUOxmf1mLv4hTNjwliRoxcRJhyHRQ01D
 ankvjXaH8g7d+XsCBQrda8itPn+heB9hfEtGyyxVKOOAe0p+0NsPOlTqg+40oBjVpJa5
 tiyp+zimtanECAF5ZBPH6aSNzKm07yHoOqlZhp1D8b62DHm8FbI90+JbklTaMudQRpOn
 lwb6hQ3WV0dZohdY0pXymR9jmX/amX/UMCtO1URGyn15dp8mJT10CRT4fC1U/OwERHpw
 XqVw==
X-Gm-Message-State: AOAM531giyqpdaD8+33P8PY0FXJnqVnMkRX+97jO1O6pdjBSl2RFndie
 UgrmEAOlESZUBKAMfEAj57Vd0cE46hs0PpjTuLf2LIlnulw3r8QNXXJH82GFSmQ61EA0QJQlgDx
 8GkBAy2WUIgmx3eS0s3lH/YfsSIEA82gak9Erlw==
X-Received: by 2002:adf:f30a:0:b0:20a:e193:6836 with SMTP id
 i10-20020adff30a000000b0020ae1936836mr17475071wro.654.1651686760685; 
 Wed, 04 May 2022 10:52:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUqdtlq6DRnJ4Zi/osRG+d5cliZmFt2ncO+uls6odhjFDHMm5eVQLCV2/rPOY0uYNiWgHK/0VQSsjVzjh+e/E=
X-Received: by 2002:adf:f30a:0:b0:20a:e193:6836 with SMTP id
 i10-20020adff30a000000b0020ae1936836mr17475050wro.654.1651686760467; Wed, 04
 May 2022 10:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220426145445.2282274-1-agruenba@redhat.com>
 <CAHk-=wi7o+fHYBTuCQQdHD112YHQtO21Y3+wxNYypjdo8feKFg@mail.gmail.com>
 <CAHc6FU48681X8aUK+g7UUN7q5b6rkVBzTP7h_zbE4XqZYAiw3g@mail.gmail.com>
 <CAHk-=wjMB1-xCOCBtsSMmQuFV9G+vNyCY1O_LsoqOd=0QS4yYg@mail.gmail.com>
 <CAHc6FU5Bag5W2t79+WzUq=NibtEF+7z6=jyNCkLMMp9Yqvpmqw@mail.gmail.com>
 <CAHk-=whaz-g_nOOoo8RRiWNjnv2R+h6_xk2F1J4TuSRxk1MtLw@mail.gmail.com>
 <CAHc6FU5654k7QBU97g_Ubj8cJEWuA_bXPuXOPpBBYoXVPMJG=g@mail.gmail.com>
 <CAHk-=wgSYSNc5sF2EVxhjbSc+c4LTs90aYaK2wavNd_m2bUkGg@mail.gmail.com>
 <CAHc6FU69E4ke4Xg3zQ2MqjLbfM65D9ZajdY5MRDLN0azZOGmVQ@mail.gmail.com>
 <CAHk-=whQxvMvty8SjiGMh+gM4VmCYvqn6EAwmrDXJaHT2Aa+UA@mail.gmail.com>
 <CAHk-=wicJdoCjPLu7FhaErr6Z3UaW820U2b+F-8P4qwSFUZ0mg@mail.gmail.com>
 <CAHc6FU7GkXLkns5PONLvsSi6HB+rjaNSyFeQFS034tKL-JueMw@mail.gmail.com>
 <CAHk-=wg4ypnZUA5BOHAF1miKvOhW2yQSruuBKNXMDR=dTmp+ww@mail.gmail.com>
 <CAHk-=whL74iP6v2P+OafGO0H72ag4wt42k+Kc_01boLP8aqUNQ@mail.gmail.com>
 <CAHc6FU77KGn76B4ieu9Tn895deK-1yV4y=8ou4gTfUf=7C-4XQ@mail.gmail.com>
 <CAHc6FU7i4GJaSodNX+o44VgWyo1LTPdYkBnypYS3GYa1atYAZA@mail.gmail.com>
 <20220503213524.3273690-1-agruenba@redhat.com>
 <CAHk-=wjQwqW+FJ_dsq8M58=5joQdV+8Q51bmyjvrBV6Z68VF0Q@mail.gmail.com>
In-Reply-To: <CAHk-=wjQwqW+FJ_dsq8M58=5joQdV+8Q51bmyjvrBV6Z68VF0Q@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 4 May 2022 19:52:29 +0200
Message-ID: <CAHc6FU4RBTOmKe5LJmQJfszg3r_giFM7zv9mYJmMjH8_UvmpYA@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: Re: [Cluster-devel] [GIT PULL] gfs2 fix
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
Cc: "Darrick J. Wong" <djwong@kernel.org>,
 cluster-devel <cluster-devel@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, May 4, 2022 at 12:42 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Tue, May 3, 2022 at 2:35 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> >
> > More testing still ongoing, but the following patch seems to fix the
> > data corruption.
>
> Fingers crossed.

It turns out that crossing fingers wasn't enough and we still get
corruption, but less frequently than before. We're going in the right
direction.

My working theory is that this is due to a subtle bug in the hole
punching done by gfs2_iomap_end() to get rid of unused blocks. With
the test case that fails, gfs2_iomap_end() is punching holes way more
often than I was expecting, and way more often than it should.
Remember that the test case is doing 32-MiB writes of a user buffer
that usually isn't entirely in memory. The first
iomap_file_buffered_write() allocates filesystem blocks for the entire
buffer, and when it finds that it could only do a partial write, it
frees a large part of those blocks. It will then call
fault_in_iov_iter_readable() for the next chunk, and the next call to
iomap_file_buffered_write() will then usually be able to write that
chunk entirely.

So it seems that we should always call fault_in_iov_iter_readable()
before calling into iomap_file_buffered_write(). This will probably
hide whatever is going wrong in punch_hole(), but we'll get to that
later ...

(Side note: the chunk size should be aligned to the page cache, not to
the iov_iter as in the current code.)

> > +               truncate_pagecache_range(inode, hstart, hend - 1);
> > +               if (hstart < hend)
> > +                       punch_hole(ip, hstart, hend - hstart);
>
> Why doesn't that "hstart < hend" condition cover both the truncate and
> the hole punch?

That was a leftover from a previous experiment in which I did the
truncate_pagecache_range() on the unaligned boundaries. Which turned
out to be pointless. I'll clean that up.

Thanks,
Andreas

