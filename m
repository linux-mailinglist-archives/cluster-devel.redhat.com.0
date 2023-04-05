Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C6F6D8A71
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Apr 2023 00:15:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680732929;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=sr4CJdOOx/6apQcfPjVNK8msYC2J6U4ttJpvFiO5hDA=;
	b=O/m9WWmhJRigTMHR1a+RtAs7v7yCbySsUk13OuwO0NT2XwR4azsGNQ3HMRPEtiJEztEhZw
	8rbmMUJUQwKYv7OQEdB9wnCKK/i7IMj3GTFTJlscle4+t6loLeSAPj6I5GQK619fKx3yOZ
	9oztUiKvUlXpfN8wmeGyWYCnjMkGSkw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-376-DJ0DHgE0PE6D-5tXLjWavg-1; Wed, 05 Apr 2023 18:15:25 -0400
X-MC-Unique: DJ0DHgE0PE6D-5tXLjWavg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDD7F3C02527;
	Wed,  5 Apr 2023 22:15:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D2850400F4F;
	Wed,  5 Apr 2023 22:15:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B470A1946597;
	Wed,  5 Apr 2023 22:15:24 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CF139194658F for <cluster-devel@listman.corp.redhat.com>;
 Wed,  5 Apr 2023 22:15:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 993B240BC797; Wed,  5 Apr 2023 22:15:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9269740C6EC4
 for <cluster-devel@redhat.com>; Wed,  5 Apr 2023 22:15:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 781E91C05198
 for <cluster-devel@redhat.com>; Wed,  5 Apr 2023 22:15:01 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-522-HGPJDMIAO8Wy_fvYwmM6tw-1; Wed, 05 Apr 2023 18:14:59 -0400
X-MC-Unique: HGPJDMIAO8Wy_fvYwmM6tw-1
Received: by mail-pg1-f170.google.com with SMTP id 185so11502420pgc.10
 for <cluster-devel@redhat.com>; Wed, 05 Apr 2023 15:14:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680732898;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sr4CJdOOx/6apQcfPjVNK8msYC2J6U4ttJpvFiO5hDA=;
 b=TyLk75Dlm3q/dtApgMGcWCSowyjR8cQkcEBe7EqsU3svti2ocFL91rm/Hg+UzsWxN2
 aRCpcolhczEzTjkijBoZaPrst1+oVu22OWJwrd3Z2U6vsTbGHWMDRGH+ax32tFtJBG3U
 Rb68a0p+1MaZnfQpu1jkSYKG1T3ReJ9pvvR96qgpV3EGJlhIRMssoyWhtgOk85xLsiVt
 /GWml287oIaPHAy40IfD/5ksqImw6Q5d5PSEW7JIMxFg/FcxAZhfSsEN6zSVg0JytkqV
 8fteG1m6xFKBrgohelY/LWu6aIexRqo65kvLWiX2wZKDpGXmdMpVKbKN/0bgW+hOCq8l
 L8cQ==
X-Gm-Message-State: AAQBX9dYQZyLDsCoF0sq+cDxMSOa+V+E9wQ7lrTob0Jr/R9QDfVbth+t
 nR+g7IMoMty63TvIUzkwRup6VA==
X-Google-Smtp-Source: AKy350buwNZtgpjQjNrpY+dRBomVST4nFtdRBnQ6Mea8vZue8EC+2ZTK97MNMJLE5y0NZdZDQ14O+g==
X-Received: by 2002:aa7:9a44:0:b0:626:1c2a:2805 with SMTP id
 x4-20020aa79a44000000b006261c2a2805mr5960988pfj.25.1680732898541; 
 Wed, 05 Apr 2023 15:14:58 -0700 (PDT)
Received: from dread.disaster.area (pa49-181-91-157.pa.nsw.optusnet.com.au.
 [49.181.91.157]) by smtp.gmail.com with ESMTPSA id
 t17-20020a62ea11000000b005a9ea5d43ddsm11542560pfh.174.2023.04.05.15.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 15:14:58 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1pkBP4-00HUS4-Uz; Thu, 06 Apr 2023 08:14:54 +1000
Date: Thu, 6 Apr 2023 08:14:54 +1000
From: Dave Chinner <david@fromorbit.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20230405221454.GQ3223426@dread.disaster.area>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-20-aalbersh@redhat.com>
 <20230404161047.GA109974@frogsfrogsfrogs>
 <20230405150142.3jmxzo5i27bbc4c4@aalbersh.remote.csb>
 <20230405150927.GD303486@frogsfrogsfrogs>
 <ZC2YsgYRsvBejGYY@infradead.org> <ZC23x22bxItnsANI@gmail.com>
MIME-Version: 1.0
In-Reply-To: <ZC23x22bxItnsANI@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH v2 19/23] xfs: disable direct read path
 for fs-verity sealed files
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
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, "Darrick J. Wong" <djwong@kernel.org>,
 Andrey Albershteyn <aalbersh@redhat.com>, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 xiang@kernel.org, jth@kernel.org, linux-erofs@lists.ozlabs.org,
 damien.lemoal@opensource.wdc.com, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: fromorbit.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 05, 2023 at 06:02:47PM +0000, Eric Biggers wrote:
> And I really hope that you don't want to do DIO to the *Merkle tree*, as that

Not for XFS - the merkle tree is not held as file data.

That said, the merkle tree in XFS is not page cache or block aligned
metadata either, so we really want the same memory buffer based
interface for the merkle tree reading so that the merkle tree code
can read directly from the xfs-buf rather than requiring us to copy
it out of the xfsbuf into temporary pages...

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

