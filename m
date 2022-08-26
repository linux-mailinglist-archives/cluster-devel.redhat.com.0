Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B285A2886
	for <lists+cluster-devel@lfdr.de>; Fri, 26 Aug 2022 15:28:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661520534;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=sgxwSFOIh54EtZVmIF6eRuoxcZoMjiIGAdMZ3OxKrqI=;
	b=c4nomtlJWrmYN+6E5Y/JCI8IXyuxyk37rymE7JHhOt3b5kft7/+jDZjfCpTSZVkG+bSGXp
	vyv+MLM7shv4rMRlPUVSj9PP8Nvczh42cg6PzoAIkBGSQspPq/2+iKZRxdXV/iUyTEkGdO
	bbGCRg67ONpyA6D1IZxMRJVCZDzNs+o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-500-vWcUhpNFOwSnZKUEt8U7Hg-1; Fri, 26 Aug 2022 09:28:51 -0400
X-MC-Unique: vWcUhpNFOwSnZKUEt8U7Hg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6254983DE55;
	Fri, 26 Aug 2022 13:28:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 52AD11121315;
	Fri, 26 Aug 2022 13:28:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 177641946A52;
	Fri, 26 Aug 2022 13:28:47 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3EE5F1946A43 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 26 Aug 2022 13:28:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E933E2166B29; Fri, 26 Aug 2022 13:28:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E5C482166B26
 for <cluster-devel@redhat.com>; Fri, 26 Aug 2022 13:28:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8B2380A1D5
 for <cluster-devel@redhat.com>; Fri, 26 Aug 2022 13:28:44 +0000 (UTC)
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-459-pfHcczCCOUOZQN6sWrX17w-1; Fri, 26 Aug 2022 09:28:41 -0400
X-MC-Unique: pfHcczCCOUOZQN6sWrX17w-1
Received: by mail-pf1-f200.google.com with SMTP id
 a19-20020aa780d3000000b0052bccd363f8so893892pfn.22
 for <cluster-devel@redhat.com>; Fri, 26 Aug 2022 06:28:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=sgxwSFOIh54EtZVmIF6eRuoxcZoMjiIGAdMZ3OxKrqI=;
 b=cmke2PLlkruRuPXWDcQP9lnxf2JS9u8SdSqgIVq1XGaw0NkHjCEpvdgBDHF1lacg8g
 G66wBnl06o1ZKmPCcGpI65eIsdMuGmu68akUXO3zj8pGUv7MV2q4Nt8d/JT2xH4j2A3p
 Uel3I31WNUXhZCikYw35f3VoS4WXlK9Gnh0ubc5vuHIHHJexdMKauLjS1R2Pu6vVyFx4
 9rBi0yXi/iVvuET2ibPfACj6R6lzkshF7fbNjDQGM1ec13aNcjAg/CgMPx1ltpbYffzK
 IUdrj4QTpE8BM9DZZO32F1LcTKLTIYt4DswPJBTKpYCdvRglkxK51aDJ5Ny56WJIO8So
 AzBg==
X-Gm-Message-State: ACgBeo1E1+dItC17WCJb2GRpTcM/bp5Ta+OPC9q7TLe235gLxdMszyUe
 MvYtvKYJlL0bgfJ+AHv3Theqt+Iuh1aYYrj6gDa4JpgP4VwGvXwIJjIctNsiZ90lPPfLM8bNpqc
 jU+ytXEVaKWc/Jnn0n8WVgNtQvOX48KDu5Fdnlg==
X-Received: by 2002:a05:6a00:15ce:b0:537:24ee:cbcf with SMTP id
 o14-20020a056a0015ce00b0053724eecbcfmr3794899pfu.30.1661520520378; 
 Fri, 26 Aug 2022 06:28:40 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5GXmUOOA8TaJrQGAd0RVSO5V8ppVyacwCExmmyD+lUPx9uKDeCnQ22UA3d09DQa33dIJwDyQ32kbXmPafZg+Y=
X-Received: by 2002:a05:6a00:15ce:b0:537:24ee:cbcf with SMTP id
 o14-20020a056a0015ce00b0053724eecbcfmr3794882pfu.30.1661520520137; Fri, 26
 Aug 2022 06:28:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220818210144.7915-1-wsa+renesas@sang-engineering.com>
 <bd7275c6-4ebe-de99-75c2-400cfa2e5026@redhat.com> <YwaFRvWw5hi/uWYs@shikoro>
 <d53a4672-d068-c394-6ab1-058b2d72701f@redhat.com>
In-Reply-To: <d53a4672-d068-c394-6ab1-058b2d72701f@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 26 Aug 2022 15:28:28 +0200
Message-ID: <CAHc6FU4g_6qYsUoFOnfcX5e2=XiZCu76EUy8kFP1AHDW0f6zyQ@mail.gmail.com>
To: Andrew Price <anprice@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: Re: [Cluster-devel] [PATCH] gfs2: move from strlcpy with unused
 retval to strscpy
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
Cc: cluster-devel@redhat.com, Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Wolfram and Andy,

On Thu, Aug 25, 2022 at 11:33 AM Andrew Price <anprice@redhat.com> wrote:
> On 24/08/2022 21:08, Wolfram Sang wrote:
> > Hi Andy.
> >
> >>> -   strlcpy(sdp->sd_proto_name, proto, GFS2_FSNAME_LEN);
> >>> -   strlcpy(sdp->sd_table_name, table, GFS2_FSNAME_LEN);
> >>> +   strscpy(sdp->sd_proto_name, proto, GFS2_FSNAME_LEN);
> >>> +   strscpy(sdp->sd_table_name, table, GFS2_FSNAME_LEN);
> >>
> >> Perhaps the size should be changed to GFS2_LOCKNAME_LEN to match the size of
> >> the destination, too.
> >>
> >> With that addition, this patch fixes this syzkaller report:
> >>
> >> https://listman.redhat.com/archives/cluster-devel/2022-August/022755.html
> >
> > Linus wrote another summary about strlcpy vs. strscpy use[1]. So, the
> > size argument should be the size of the smaller buffer if the buffers
> > are of different size. GFS2_LOCKNAME_LEN is smaller, so that looks
> > suitable. Shall I resend the patch with the suggested change?
>
> Yes, please. I can't speak for the gfs2 maintainers but I think it would
> be a good plan, as the combination of strscpy and the size change fixes
> a bug.

thanks, I've fixed this in for-next now:

https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git/commit/?h=for-next&id=204c0300c4e99707e9fb6e57840aa1127060e63f

Andreas

