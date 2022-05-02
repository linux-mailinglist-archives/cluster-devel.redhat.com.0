Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E82517704
	for <lists+cluster-devel@lfdr.de>; Mon,  2 May 2022 20:59:01 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-320-Zr8cl_6zMLaPdBBWJCPbow-1; Mon, 02 May 2022 14:58:56 -0400
X-MC-Unique: Zr8cl_6zMLaPdBBWJCPbow-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C328833942;
	Mon,  2 May 2022 18:58:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 090A9401DBE;
	Mon,  2 May 2022 18:58:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BD5CA1947054;
	Mon,  2 May 2022 18:58:54 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CE1A11947042 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  2 May 2022 18:58:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9AB50C27EA5; Mon,  2 May 2022 18:58:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 77306C27E91
 for <cluster-devel@redhat.com>; Mon,  2 May 2022 18:58:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B70F86B8AB
 for <cluster-devel@redhat.com>; Mon,  2 May 2022 18:58:53 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-341-GMAqNtE2MZ2JILZnFqGAaQ-1; Mon, 02 May 2022 14:58:51 -0400
X-MC-Unique: GMAqNtE2MZ2JILZnFqGAaQ-1
Received: by mail-lj1-f173.google.com with SMTP id t25so2706173ljd.6
 for <cluster-devel@redhat.com>; Mon, 02 May 2022 11:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CECE6TSK8MHjSmTIWBnzhHFpumjz5uVxh+Sa8svO4Ik=;
 b=L5BKnJpZZVVniDV5Je0My8fmTu7LWh6JxWoEEmAzIkTeSxFABYNoE6KyVh9Wn4NVny
 1OKKbjL6ZGrieEkv9KYZu4N2WECn//mgTFqXCFlMFwAQBFLJ/Rtx4zrP5GOgCDZPnnMd
 OU/dn7XuMYKds0LGTqd8t6IU9kA+KrHKhFRDQ5cmki+HiIFCS/JpIF3Zy0n1FcapFRaF
 O4vB6sQ38IgdFOzpxPvw9+iDYSlaQBmNKrAb/tIW7UhlUk9GNQ0FMDsTHTQeZTM7cke/
 035dnG+A4gl9+sLN7eskl50MCieirf1oZ0oO63vkDxPZOX/ObfzeX81Mtft8EJRQf3pK
 NAvw==
X-Gm-Message-State: AOAM532/+YWKKuGMnfYbFnMI/K1nKEpa8YvAM9Zcrb5KoqWxX4DQdkro
 4ut0gOcDWa4ViWHElqcYP2pPdEKO5MFiUYNP
X-Google-Smtp-Source: ABdhPJxoSkxgnVCW2CpapNkM2cu+q+M5KW9sY88qhUG1srNNKEWi0Iptu23lA1nsiaVmOkYs8hgZ0g==
X-Received: by 2002:a05:651c:505:b0:24f:5248:3018 with SMTP id
 o5-20020a05651c050500b0024f52483018mr5240919ljp.45.1651517929993; 
 Mon, 02 May 2022 11:58:49 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
 [209.85.208.181]) by smtp.gmail.com with ESMTPSA id
 p15-20020a2e9a8f000000b0024f3d1daed6sm1129610lji.94.2022.05.02.11.58.48
 for <cluster-devel@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 11:58:48 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id m23so19560112ljc.0
 for <cluster-devel@redhat.com>; Mon, 02 May 2022 11:58:48 -0700 (PDT)
X-Received: by 2002:a2e:8789:0:b0:24f:124c:864a with SMTP id
 n9-20020a2e8789000000b0024f124c864amr8342835lji.164.1651517927914; Mon, 02
 May 2022 11:58:47 -0700 (PDT)
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
In-Reply-To: <CAHk-=whL74iP6v2P+OafGO0H72ag4wt42k+Kc_01boLP8aqUNQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 2 May 2022 11:58:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=whrt9ofcyonPEbgPOaCG+15mDdz+O9bb0RKrJVTt7vR4w@mail.gmail.com>
Message-ID: <CAHk-=whrt9ofcyonPEbgPOaCG+15mDdz+O9bb0RKrJVTt7vR4w@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>,
 Christoph Hellwig <hch@infradead.org>, 
 "Darrick J. Wong" <djwong@kernel.org>, Dave Chinner <dchinner@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
Cc: cluster-devel <cluster-devel@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, May 2, 2022 at 11:31 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> NOTE! This patch is entirely untested. I also didn't actually yet go
> look at what gfs2 does when 'bytes' and 'copied' are different.

Oh, it's a lot of generic iomap_write_end() code, so I guess it's just
as well that I brought in the iomap people.

And the iomap code has many different cases. Some of them do

        if (unlikely(copied < len && !folio_test_uptodate(folio)))
                return 0;

to force the whole IO to be re-done (looks sane - that's the "the
underlying folio wasn't uptodate, because we expected the write to
make it so").

And that might not have happened before, but it looks like gfs2 does
actually try to deal with that case.

But since Andreas said originally that the IO wasn't aligned, I don't
think that "not uptodate" case is what is going on, and it's more
about some "partial write in the middle of a buffer succeeded"

And the code also has things like

        if (ret < len)
                iomap_write_failed(iter->inode, pos, len);

which looks very wrong - it's not that the write failed, it's just
incomplete because it was done with page faults disabled. It seems to
try to do some page cache truncation based on the original 'len', but
not taking the successful part into account. Which all sounds
horrifically wrong.

But I don't know the code well enough to really judge. It just makes
me uncomfortable, and I do suspect this code may be quite buggy if the
copy of the full 'len' doesn't succeed.

Again, the patch I sent only _hides_ any issues and makes them
practically impossible to see. It doesn't really _fix_ anything, since
- as mentioned - regardless of fault_in_iov_iter_readable()
succeeding, racing with page-out could then cause the later
copy_page_from_iter_atomic() to have a partial copy anyway.

And hey, maybe there's something entirely different going on, and my
"Heureka! It might be explained by that partial write_end that
generally didn't happen before" is only my shouting at windmills.

             Linus

