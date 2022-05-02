Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3230F517811
	for <lists+cluster-devel@lfdr.de>; Mon,  2 May 2022 22:24:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1651523097;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=UdZt71erzInkdQWP9nE3aPOYbCeSzdBMVJZpOjnab6U=;
	b=T3M73+WRgx70IlvKVL3MIWAyxMddLPrFMpRKJiXZXNzKHv48+QxS7ZOMWbIHcAJYrSDfE9
	jFylKZSG1+v29ldePDTOP/I1EtiOBRhPp/+i8EmvGD4h+I8/k5G8CmDfTq7NYwdK5iovKr
	RzLP92TcSpMPXRjHs4pDe7gBSqbNU3E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-247-5xwClOFVPb-JG70tl5DMDg-1; Mon, 02 May 2022 16:24:56 -0400
X-MC-Unique: 5xwClOFVPb-JG70tl5DMDg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EAF241C151AD;
	Mon,  2 May 2022 20:24:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ED5C140CFD08;
	Mon,  2 May 2022 20:24:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 53492194704C;
	Mon,  2 May 2022 20:24:53 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 834F41947042 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  2 May 2022 20:24:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 718CB150DE1E; Mon,  2 May 2022 20:24:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DF3E150DE1C
 for <cluster-devel@redhat.com>; Mon,  2 May 2022 20:24:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 564801C151AF
 for <cluster-devel@redhat.com>; Mon,  2 May 2022 20:24:52 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-350-hBnGt1XbOzSjcgz3RAtApw-1; Mon, 02 May 2022 16:24:43 -0400
X-MC-Unique: hBnGt1XbOzSjcgz3RAtApw-1
Received: by mail-wm1-f72.google.com with SMTP id
 g14-20020a1c4e0e000000b0039425ef54d6so134779wmh.9
 for <cluster-devel@redhat.com>; Mon, 02 May 2022 13:24:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UdZt71erzInkdQWP9nE3aPOYbCeSzdBMVJZpOjnab6U=;
 b=oKv1qUAt7U8Kj0rrsedvbWGodpxraTV1OzkH9+qtD6fKU4/85mJfVasC+aO/xwS8h4
 gVWgC/N8ZekZmJdU/9oqDgTTjBljFxMh1HYheUuKCTj8qLrvSiTS4MoH5HttT58mxDJK
 Tjm237s5ok7V7em0YUNY/GQgEIt9rWFfyH2MfhlLhlnbbUttBOCOV8mTzoQV3ivQJqSN
 0lyB0AYgxhk3aJrDAUiptOr6XepCPijqm6FTTE+BzUpHLpa6IuERlmk3EQCBC42jMlV2
 9QSQMkVooQb/78f1xGj7Br3gGMOVEws84mi4vvFxArLixD58/E+GXTjNx5WekaIPHgQk
 1SYw==
X-Gm-Message-State: AOAM531hubXGP8Zrfo3088UfYn1hVyQDSwO6nyaCykSStY/3ShdW2PIo
 v7+0nkSzY2LC33TU6oW2F6vh2SssHew9DcLkCHMOClj+30IrBqC535qiHejoUY8PNwuWPFSWnO9
 B2WT3TqWCRQC5AgimDHBx04pgHo4YReN77l6H0Q==
X-Received: by 2002:a1c:2942:0:b0:392:3aff:4fcd with SMTP id
 p63-20020a1c2942000000b003923aff4fcdmr620244wmp.0.1651523082222; 
 Mon, 02 May 2022 13:24:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcEsBewr8W5eVg62nkR1Wb4KVlY1M0XsuVK3vz1ojcr4Vc7wcJuVZJYI+tEdl0Qe0q+ayeeD8mjC8Nl1rx4+U=
X-Received: by 2002:a1c:2942:0:b0:392:3aff:4fcd with SMTP id
 p63-20020a1c2942000000b003923aff4fcdmr620231wmp.0.1651523081803; Mon, 02 May
 2022 13:24:41 -0700 (PDT)
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
 <CAHc6FU6VgQDO7HT5f4S_4f=9hczKGRDQ6SbQ5kNHMi4i-6rxVA@mail.gmail.com>
 <CAHk-=whL74iP6v2P+OafGO0H72ag4wt42k+Kc_01boLP8aqUNQ@mail.gmail.com>
 <CAHk-=whrt9ofcyonPEbgPOaCG+15mDdz+O9bb0RKrJVTt7vR4w@mail.gmail.com>
In-Reply-To: <CAHk-=whrt9ofcyonPEbgPOaCG+15mDdz+O9bb0RKrJVTt7vR4w@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 2 May 2022 22:24:30 +0200
Message-ID: <CAHc6FU7TRD_2H6H4ucoqQ-8Q1d0xtoT68uopbZGQPwO9Z1k0kw@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, May 2, 2022 at 8:58 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Mon, May 2, 2022 at 11:31 AM Linus Torvalds <torvalds@linux-foundation.org> wrote:
> >
> > NOTE! This patch is entirely untested. I also didn't actually yet go
> > look at what gfs2 does when 'bytes' and 'copied' are different.
>
> Oh, it's a lot of generic iomap_write_end() code, so I guess it's just
> as well that I brought in the iomap people.
>
> And the iomap code has many different cases. Some of them do
>
>         if (unlikely(copied < len && !folio_test_uptodate(folio)))
>                 return 0;
>
> to force the whole IO to be re-done (looks sane - that's the "the
> underlying folio wasn't uptodate, because we expected the write to
> make it so").
>
> And that might not have happened before, but it looks like gfs2 does
> actually try to deal with that case.
>
> But since Andreas said originally that the IO wasn't aligned, I don't
> think that "not uptodate" case is what is going on, and it's more
> about some "partial write in the middle of a buffer succeeded"
>
> And the code also has things like
>
>         if (ret < len)
>                 iomap_write_failed(iter->inode, pos, len);
>
> which looks very wrong - it's not that the write failed, it's just
> incomplete because it was done with page faults disabled. It seems to
> try to do some page cache truncation based on the original 'len', but
> not taking the successful part into account. Which all sounds
> horrifically wrong.
>
> But I don't know the code well enough to really judge. It just makes
> me uncomfortable, and I do suspect this code may be quite buggy if the
> copy of the full 'len' doesn't succeed.

This has thrown me off in the past as well; it should be changed to
iomap_write_failed(iter->inode, pos + ret, len - ret) for legibility.
However, iomap_write_failed() only truncates past EOF and is preceded
by i_size_write(iter->inode, pos + ret) here, so it's not strictly a
bug.

> Again, the patch I sent only _hides_ any issues and makes them
> practically impossible to see. It doesn't really _fix_ anything, since
> - as mentioned - regardless of fault_in_iov_iter_readable()
> succeeding, racing with page-out could then cause the later
> copy_page_from_iter_atomic() to have a partial copy anyway.

Indeed. Let's see what we'll get with it.

In the meantime, we've reproduced with 5.18-rc4 + commit 296abc0d91d8
("gfs2: No short reads or writes upon glock contention"), and it still
has the data corruption.

> And hey, maybe there's something entirely different going on, and my
> "Heureka! It might be explained by that partial write_end that
> generally didn't happen before" is only my shouting at windmills.
>
>              Linus
>

