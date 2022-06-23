Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 01729557ED1
	for <lists+cluster-devel@lfdr.de>; Thu, 23 Jun 2022 17:45:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655999105;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=hVsMwhEGikbOz+l9gDUt9fGCFF1D4HFwxBrBZO+o3ng=;
	b=JblVg1JHfui8LH/wdEWZLBPHZ+SNet3ob/CBECPStBu3eZDeEkRSHyGVz4BOOX+6lZ4o7W
	zmy9/KWiywDSSqLKuwnQ0Kz+G8/dznoMIxKM4ON6JQ4yWnud0dCp0tjaN+Mkz7YWlTn/EL
	LYoJLul+zpMxMKE9OOLScgAtwL5p9vY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-R5fJ1OzwMj2ZRE-M_SSF2Q-1; Thu, 23 Jun 2022 11:45:00 -0400
X-MC-Unique: R5fJ1OzwMj2ZRE-M_SSF2Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B108811E90;
	Thu, 23 Jun 2022 15:44:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A488C2026D64;
	Thu, 23 Jun 2022 15:44:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 39B68194B959;
	Thu, 23 Jun 2022 15:44:58 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 69133194B950 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 23 Jun 2022 15:44:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 17F5640C1421; Thu, 23 Jun 2022 15:44:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1424840C141F
 for <cluster-devel@redhat.com>; Thu, 23 Jun 2022 15:44:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F01FF801756
 for <cluster-devel@redhat.com>; Thu, 23 Jun 2022 15:44:55 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-wC2hptyzNkydFykU-eT4gQ-1; Thu, 23 Jun 2022 11:44:53 -0400
X-MC-Unique: wC2hptyzNkydFykU-eT4gQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 p6-20020a05600c358600b0039c873184b9so1583303wmq.4
 for <cluster-devel@redhat.com>; Thu, 23 Jun 2022 08:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hVsMwhEGikbOz+l9gDUt9fGCFF1D4HFwxBrBZO+o3ng=;
 b=AhUuHBKiAR10Q7MLewJT7Gq2GoH7I00aPG9c+sqlzENICbpNgjJOfWBYRQAPUvin6E
 Vziv8ZSXvxasynhXkFrdBihw+gVdbErdRK1XNyMI/PfhchpWZWBEqeELQARfWDifVsSX
 PQf6fUBbHzM+d/FUJDoLbPIrurOmLNpgkG7rLEXQZaY12chr1jC8vEvul04nRQOZvE83
 2KgS2qfv1Z7VO6HwsokKc6snzxLKSyn/QzZeCPYgbA5WRZi9LCzwnNMYelHf6CByY9+f
 PqzdK6fS/CbI0FsGQRwOPvcACfIP3kn1mbMAvn8lqIFEZuG1BniycAEqkjJkQN1h/JZt
 klmg==
X-Gm-Message-State: AJIora8+JcDS1vG5qvlPcf3PII+76T4qlrJ4VTdDvEkdaA55YVZh44f7
 qUSg1/sNpo4fVlEnZpT1x1WlgdOCf3Cp4tHRnyInV8eFZA+VGWfhko7DAyFRqgzN+wcSzaDZLVi
 NtdYBZW1u53NvNMoje8fFfVP+5pl+Ro3lQBgfsw==
X-Received: by 2002:adf:e60c:0:b0:21b:8bac:70ff with SMTP id
 p12-20020adfe60c000000b0021b8bac70ffmr9185450wrm.467.1655999091112; 
 Thu, 23 Jun 2022 08:44:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sODvhms1eypss0BCx5TJGmHtNzifXX3NTywj7uPODDB1rEHaX8UCZiadnSgWQ7DVaJuuOiKEOZdKjW2FozmDg=
X-Received: by 2002:adf:e60c:0:b0:21b:8bac:70ff with SMTP id
 p12-20020adfe60c000000b0021b8bac70ffmr9185437wrm.467.1655999090941; Thu, 23
 Jun 2022 08:44:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220621091420.GC3256@lst.de>
 <97a9a768-1915-f532-09a4-99ee78a639ae@redhat.com>
 <20220621125857.GA6999@lst.de> <20220622143007.GA31207@lst.de>
In-Reply-To: <20220622143007.GA31207@lst.de>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 23 Jun 2022 17:44:39 +0200
Message-ID: <CAHc6FU7JSui4NmHbEtLKO+H4Uh4OqBGbUu=bpuBoF9EvGk41sg@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>, Matthew Wilcox <willy@infradead.org>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: Re: [Cluster-devel] Mounting lock_nolock file systems?
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
Cc: cluster-devel <cluster-devel@redhat.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 22, 2022 at 4:32 PM Christoph Hellwig <hch@lst.de> wrote:
> On Tue, Jun 21, 2022 at 02:58:57PM +0200, Christoph Hellwig wrote:
> > Sorry, actually it was the pagecache for-next branch from willy.  Looks
> > like mainline itself is fine.
> >
> > I'll try to get the superblock information from the pagecache branch
> > once I find a little time, chasing a bunch of other bugs in the meantime.
>
> I bisected it down to:
>
> commit 1abe0e8c19c514827408ba7e7e84969b6f2e784f
> Author: Matthew Wilcox (Oracle) <willy@infradead.org>
> Date:   Wed May 18 14:41:39 2022 -0400
>
>     gfs: Check PageUptodate instead of PageError
>
>     This is the correct flag to test to know if the read completed
>     successfully.
>
>     Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
>
> but I don't have any explanation how it caused that breakage yet.

gfs2_find_jhead() uses gfs2_end_log_read() as the end_io function of
the bios it submits, and gfs2_end_log_read() doesn't set the pages it
reads uptodate. That should be fixed; it doesn't make much sense.

Willy, can you remove the above patch from the pagecache tree? We can
put it in the gfs2 tree after that gfs2_end_log_read() fix.

(Side note: it's gfs2, not gfs.)

Thanks,
Andreas

