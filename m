Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D96764FDE
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Jul 2023 11:33:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690450384;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=F4KgyDeQrSBviYcAIl4THJ/dOEwnDjoTrG5uDNKkzwM=;
	b=heMUk8gSOwEubp7cHHJDbNfjAdfvstH1EuODF4qbK3tH0IcBinq0IcJ1t1gMglx+4B7b84
	T3DPITQNFWk9TPuedmKTpiUp8tSLRTZpYiLD+h9+0Bunef+I5xvWZSH23FdEJ4RXGNs8PU
	Rjg/53ZyRkHRAFW4as4s5YBBaQ8ITX0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-679-dzrTSJrWMGSntWj7Iane0g-1; Thu, 27 Jul 2023 05:33:01 -0400
X-MC-Unique: dzrTSJrWMGSntWj7Iane0g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2742B891F21;
	Thu, 27 Jul 2023 09:33:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B95011454147;
	Thu, 27 Jul 2023 09:32:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4DFF11946A71;
	Thu, 27 Jul 2023 09:32:54 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C18AA1946A6C for <cluster-devel@listman.corp.redhat.com>;
 Wed, 26 Jul 2023 15:46:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AB8B14094DC1; Wed, 26 Jul 2023 15:46:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A382C4094DC0
 for <cluster-devel@redhat.com>; Wed, 26 Jul 2023 15:46:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 845D43C0C492
 for <cluster-devel@redhat.com>; Wed, 26 Jul 2023 15:46:09 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-ZZtadMhBO7CMzT0rxhT0ZA-1; Wed, 26 Jul 2023 11:46:07 -0400
X-MC-Unique: ZZtadMhBO7CMzT0rxhT0ZA-1
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-d0a8ae5f8a6so4751738276.0
 for <cluster-devel@redhat.com>; Wed, 26 Jul 2023 08:46:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690386366; x=1690991166;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F4KgyDeQrSBviYcAIl4THJ/dOEwnDjoTrG5uDNKkzwM=;
 b=YMKORLLV4QmsrFLI4gmGgxkrVSk2/ejZ/kcS1gIqnI9vmtCVKofEtYaPt1y652sOnN
 U78HFpMSUzHoy4vzAlf40P+DzIgEpHpEi4uWYaF43Ljq8wXzaAE8X2f9iIy7eGssOfsw
 D21Y3b1Tz2f/7vMJ8zEh4vZszzMdlk2h9AfxBo3Hdd7d2YBLepJO+DIt3qz7XD65Aht8
 c4dsMa1jq4xpIeE/R+gAlWZOMhueElObL4mtqc3vSexGKnqRAi9pdpnmgqdWRufowzvi
 TLi2M2Cr/2QwgAuu1fqQeYLAhp/L3sNP+X0ZAkQ2E+87Y7+ifaicGRtCGs1/jQgeUNXO
 eaJA==
X-Gm-Message-State: ABy/qLbcrf/swIFd5n993VQj4A78dGiqz3mHTzoniGCcNaRhdzHiSBq1
 HcRhP5lH4kY2heXaA3+FKiQ/DxCgOwoUU30KGYGU2A==
X-Google-Smtp-Source: APBJJlF8/q7GpusPPrHAc1t8Ynbc8xtVqX7zeutqSFIS9pZYmvtcqn4HwbMgy47aDeoql3KKwDFgB8XgDhgRE6AS10A=
X-Received: by 2002:a5b:f45:0:b0:d0e:c8fb:986a with SMTP id
 y5-20020a5b0f45000000b00d0ec8fb986amr2197424ybr.42.1690386366531; Wed, 26 Jul
 2023 08:46:06 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000002b5e2405f14e860f@google.com>
 <0000000000009655cc060165265f@google.com>
 <CANp29Y7UVO8QGJUC-WB=CT_MKJVUzpJ2pH+e6WAcwqX_4FPgpA@mail.gmail.com>
In-Reply-To: <CANp29Y7UVO8QGJUC-WB=CT_MKJVUzpJ2pH+e6WAcwqX_4FPgpA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 26 Jul 2023 18:45:55 +0300
Message-ID: <CAA8EJpq2Az=8gLyFY7j3D8-P=PUAo6ydmzvvpkcfNQnA0OCEoA@mail.gmail.com>
To: Aleksandr Nogikh <nogikh@google.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mailman-Approved-At: Thu, 27 Jul 2023 09:32:08 +0000
Subject: Re: [Cluster-devel] [syzbot] [gfs2?] KASAN: use-after-free Read in
 qd_unlock (2)
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
Cc: syzbot <syzbot+3f6a670108ce43356017@syzkaller.appspotmail.com>,
 konrad.dybcio@linaro.org, andersson@kernel.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org, eadavis@sina.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 26 Jul 2023 at 18:09, Aleksandr Nogikh <nogikh@google.com> wrote:
>
> On Wed, Jul 26, 2023 at 5:03=E2=80=AFPM syzbot
> <syzbot+3f6a670108ce43356017@syzkaller.appspotmail.com> wrote:
> >
> > syzbot suspects this issue was fixed by commit:
> >
> > commit 41a37d157a613444c97e8f71a5fb2a21116b70d7
> > Author: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Date:   Mon Dec 26 04:21:51 2022 +0000
> >
> >     arm64: dts: qcom: qcs404: use symbol names for PCIe resets
> >
> > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D17b48111=
a80000
> > start commit:   [unknown]
> > git tree:       upstream
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dfe56f7d1939=
26860
> > dashboard link: https://syzkaller.appspot.com/bug?extid=3D3f6a670108ce4=
3356017
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D1209f878c=
80000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D111a48ab480=
000
> >
> > If the result looks correct, please mark the issue as fixed by replying=
 with:
>
> No, it's quite unlikely.

I highly suspect that the bisect was wrong here. The only thing that
was changed by the mentioned commit is the device tree for the pretty
obscure platform, which is not 'Google Compute Engine'.

>
> >
> > #syz fix: arm64: dts: qcom: qcs404: use symbol names for PCIe resets
> >
> > For information about bisection process see: https://goo.gl/tpsmEJ#bise=
ction

--=20
With best wishes
Dmitry

