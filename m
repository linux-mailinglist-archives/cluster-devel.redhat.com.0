Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2FB641DF2
	for <lists+cluster-devel@lfdr.de>; Sun,  4 Dec 2022 17:37:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670171832;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=xAcFBfhNJHwotRSc2lWCOi76ow6aaVuRhG6ZwPyPCys=;
	b=J3xM30SJSEoWVThmHf0Ik+qTrvSElld4Wqr4x98mb5+zYPeyPChTztRjrGDlqz4skPfzH8
	7xVenOMYdPWWOwcBaAG3vuef3DEW0vmSys5lZqDO7/gPZ1jl+af0n3nDphlFK5OjHcChJS
	j4R4s+mzW2MxfLMqAxkOnfTtXHhGAFI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-d5BtFTPROEi9c0sGceoJbw-1; Sun, 04 Dec 2022 11:37:08 -0500
X-MC-Unique: d5BtFTPROEi9c0sGceoJbw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3865D101A528;
	Sun,  4 Dec 2022 16:37:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 04DC3C15BAB;
	Sun,  4 Dec 2022 16:37:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 596B1194658C;
	Sun,  4 Dec 2022 16:37:04 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 25A971946587 for <cluster-devel@listman.corp.redhat.com>;
 Sun,  4 Dec 2022 16:37:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 080E8492B0B; Sun,  4 Dec 2022 16:37:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 00FB2492B08
 for <cluster-devel@redhat.com>; Sun,  4 Dec 2022 16:37:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D9D9D3C02B7C
 for <cluster-devel@redhat.com>; Sun,  4 Dec 2022 16:37:02 +0000 (UTC)
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-357-vbstgj4YPVuHXMAVQTb3Ug-1; Sun, 04 Dec 2022 11:37:01 -0500
X-MC-Unique: vbstgj4YPVuHXMAVQTb3Ug-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-3b0af5bcbd3so100931977b3.0
 for <cluster-devel@redhat.com>; Sun, 04 Dec 2022 08:37:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xAcFBfhNJHwotRSc2lWCOi76ow6aaVuRhG6ZwPyPCys=;
 b=kKLxWOlL7ujnIV5utk2TmkFY/5izlzYb8DFRMVILQgpzAh46SAk6ILpqivh4A1V232
 TFmCxO4Ub+OYSNRK+DidDnYY93jL44xJbiKF9UNv2qi4iQyMY5GiFjNEDPImAIs5ekK5
 sVuy5sitrY6uoWEineuiEPdXlOmgpRLL6EL/tsVyEbPbOJLfVukWl/tWy3UG0gwtIoaC
 Tt7LZmU0lAjqwuP3cso/avs8+JeUccDcwNUXytB2n5WytnSJwMFB1iNGyu4rMos7HtQx
 rDVZ6qFCGvtPWci2i/6vWXDLTtu3a/d04vMCDBFiZhPwfVipAZvMmBikH/dB9hbEqiP6
 mYRw==
X-Gm-Message-State: ANoB5plO8PLSr0j32J1fiOZlfrtLT23rOcNsk60IHnOxybfq3C/CyD9h
 cUDECSF/g+B6a2yYXErlQpODr0YOUGJxXnaxFW8M52kWH+Fme02ItS0bwfiree0UFvvgNR80A3k
 SsMef3DBW9Y6Mf6Oj6O//dl6p1Aj+5dxslf3BVQ==
X-Received: by 2002:a05:6902:1370:b0:6ff:eb24:45aa with SMTP id
 bt16-20020a056902137000b006ffeb2445aamr3374364ybb.321.1670171821156; 
 Sun, 04 Dec 2022 08:37:01 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6l1GEsDbt+1fLFvB5CX9o/590iQHKz3Y0r+oifb1/CEIrRXsQMblaRNYfjnfzmfVHrTa1jtlVuqyzychSWXQ4=
X-Received: by 2002:a05:6902:1370:b0:6ff:eb24:45aa with SMTP id
 bt16-20020a056902137000b006ffeb2445aamr3374352ybb.321.1670171820974; Sun, 04
 Dec 2022 08:37:00 -0800 (PST)
MIME-Version: 1.0
References: <000000000000d1663705ee97d4d7@google.com>
 <20221129203054.GF3600936@dread.disaster.area>
In-Reply-To: <20221129203054.GF3600936@dread.disaster.area>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Sun, 4 Dec 2022 17:36:49 +0100
Message-ID: <CAHc6FU4OhgPsgBGZjKEma8Qt0=HnfkTWL2mWEXCrJEi4P4SnLQ@mail.gmail.com>
To: Dave Chinner <david@fromorbit.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [syzbot] WARNING in iomap_read_inline_data
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
Cc: cluster-devel@redhat.com, djwong@kernel.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-xfs@vger.kernel.org,
 syzbot <syzbot+7bb81dfa9cda07d9cd9d@syzkaller.appspotmail.com>,
 linux-fsdevel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 29, 2022 at 9:31 PM Dave Chinner <david@fromorbit.com> wrote:
> Looks like something to do with the gfs2 inline data functionality -
> syzbot probably corrupted the resource index inode given the
> gfs2_fill_super() context.

Hmm, interesting. We're not checking the size of inline (stuffed)
inodes when reading them from disk in gfs2_dinode_in(). I'll fix that.

Thanks,
Andreas

