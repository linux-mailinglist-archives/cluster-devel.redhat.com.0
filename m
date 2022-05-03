Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2F6519194
	for <lists+cluster-devel@lfdr.de>; Wed,  4 May 2022 00:42:11 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-408-Aky3YN9nP3Gsry_Mf7wWxQ-1; Tue, 03 May 2022 18:42:05 -0400
X-MC-Unique: Aky3YN9nP3Gsry_Mf7wWxQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED04D1C05141;
	Tue,  3 May 2022 22:42:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 44164554A12;
	Tue,  3 May 2022 22:42:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F3D501947046;
	Tue,  3 May 2022 22:42:02 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8C32319466DF for <cluster-devel@listman.corp.redhat.com>;
 Tue,  3 May 2022 22:42:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4473C463E02; Tue,  3 May 2022 22:42:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 40858403156
 for <cluster-devel@redhat.com>; Tue,  3 May 2022 22:42:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27D15802819
 for <cluster-devel@redhat.com>; Tue,  3 May 2022 22:42:00 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-uJ5WJYBVPMaIynVph58IKg-1; Tue, 03 May 2022 18:41:53 -0400
X-MC-Unique: uJ5WJYBVPMaIynVph58IKg-1
Received: by mail-lf1-f46.google.com with SMTP id i10so4651988lfg.13
 for <cluster-devel@redhat.com>; Tue, 03 May 2022 15:41:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aJ6LSQS2hZp/i3Er1PZcJDTlIm5WitovxDQeaGU9cAY=;
 b=l9ajCGampBxlitbhhHewYJ5UlBXs7QxHRI5KwtiMRb5c4ogRNX27/qKM20/915c8Ze
 BpfTiHggyhjPTBES4tzLRsl04EmU3HBznYU2J/MgAohsH1TUOLowiW+QZuWg7d+Y07L5
 1AC6si/eorCYfLThNPRxqggyFY2n0CmB1a6CQ41AO1qVzZnttvVwDrWuJEIq6mzrrWM/
 Ne889SMnS/E8iWq8TynO1zg898RdDDaG3GEasZAVFsAZGgJabIykY+hJ4jUuhnUF4H9l
 b50JcK1wVp2qC+CWLVllJdlr2fMEwAkjlIJL3Xp0u8U32j7/AUHde253AZf8Ub+rnTPc
 GkCg==
X-Gm-Message-State: AOAM531JvMyWjb2lDcGtA8HLYzts1/m3/bHgw7IqaXL6HDkW5F+O0nFU
 SYEGwg5fSNFvBWqFtpD6kBQLmxGgX5mFFB/Z
X-Google-Smtp-Source: ABdhPJx7cT7VSw2Rm99WNzokyhGVza701o8AFLNSuGspJoExOeiIjSfO2pm+j1CdiI17UGDRXMJnGA==
X-Received: by 2002:a05:6512:108e:b0:473:9de5:34ee with SMTP id
 j14-20020a056512108e00b004739de534eemr6757089lfg.651.1651617711887; 
 Tue, 03 May 2022 15:41:51 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com.
 [209.85.167.41]) by smtp.gmail.com with ESMTPSA id
 g14-20020ac2538e000000b0047255d211e1sm1049811lfh.272.2022.05.03.15.41.49
 for <cluster-devel@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 15:41:50 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id w19so32626258lfu.11
 for <cluster-devel@redhat.com>; Tue, 03 May 2022 15:41:49 -0700 (PDT)
X-Received: by 2002:a05:6512:a8f:b0:473:a826:bfd0 with SMTP id
 m15-20020a0565120a8f00b00473a826bfd0mr3724913lfu.435.1651617709017; Tue, 03
 May 2022 15:41:49 -0700 (PDT)
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
In-Reply-To: <20220503213524.3273690-1-agruenba@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 3 May 2022 15:41:32 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjQwqW+FJ_dsq8M58=5joQdV+8Q51bmyjvrBV6Z68VF0Q@mail.gmail.com>
Message-ID: <CAHk-=wjQwqW+FJ_dsq8M58=5joQdV+8Q51bmyjvrBV6Z68VF0Q@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, May 3, 2022 at 2:35 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
>
> More testing still ongoing, but the following patch seems to fix the
> data corruption.

Fingers crossed.

> +               truncate_pagecache_range(inode, hstart, hend - 1);
> +               if (hstart < hend)
> +                       punch_hole(ip, hstart, hend - hstart);

Why doesn't that "hstart < hend" condition cover both the truncate and
the hole punch?

             Linus

