Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2936DE976
	for <lists+cluster-devel@lfdr.de>; Mon, 29 Apr 2019 19:46:58 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 30E73307D986;
	Mon, 29 Apr 2019 17:46:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AB9287CC;
	Mon, 29 Apr 2019 17:46:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3847018089CC;
	Mon, 29 Apr 2019 17:46:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3THkiOV022716 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 29 Apr 2019 13:46:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 49C46601B0; Mon, 29 Apr 2019 17:46:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 43F949CB0
	for <cluster-devel@redhat.com>; Mon, 29 Apr 2019 17:46:41 +0000 (UTC)
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
	[209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7B4D430602F
	for <cluster-devel@redhat.com>; Mon, 29 Apr 2019 17:46:41 +0000 (UTC)
Received: by mail-oi1-f197.google.com with SMTP id b14so3639765oii.3
	for <cluster-devel@redhat.com>; Mon, 29 Apr 2019 10:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4XNiWMXZiJc7H/jaqikR0q3+B4O1qwVQdNrN1Gohc70=;
	b=EOuOCUylIe/5k2SCe5DzZ5OoD8WY+iIVbXwniJ+wyDjbeGdWWttW/R+NKXN4TpigSJ
	0qG6hKmkSVVDttHI5H03H/gxAsi/zGlCkVzrNifRkpw974LQSQi6OPdQhBfl4J2H7+KW
	qcYey2R4Il4+GCvw+xvdTd1f3W3SMv6xJPxj6Yz03levdbuuEYXtsNDv0cDho2B0/JwK
	iYQ6U8CvNAXnFH43cjUYXYLKSpCN2IUmI1GOhJ59AYE/g/gQeSm1Bd5oD64oCJw/m8VB
	PBNqrdFg6sVbWZ0JPFGr1wGKGOX6dT8pYqnW3b4nZ4nXU/xu/ukSyMwPxLJ/VkH0r6lz
	yp0Q==
X-Gm-Message-State: APjAAAWGKDh5T7v4Mi4rNwi2UAnE2/QoJelHCv+6peTpem6X8hh0Pb+T
	rPW9bxX7tRJ+4WHInEXDwDoUcmTBJqyCbVnjVgdxQCO3Bu7S2PH/k5PM0oX4FRaJqYdVtlhfH+8
	W4oh3I4/F74IFSj3qo6d8hqMofxU14BW3PcGi/Q==
X-Received: by 2002:a9d:6397:: with SMTP id w23mr15429873otk.332.1556560000778;
	Mon, 29 Apr 2019 10:46:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwEFPov5Fcmp1Z82klYLfGXcL8lJ+7fAYAgcVryDP/nX4tHzH4FfMhdUV9XfjfQTl9aLG0Z2jy1neqZ8hWMU+s=
X-Received: by 2002:a9d:6397:: with SMTP id w23mr15429856otk.332.1556560000444;
	Mon, 29 Apr 2019 10:46:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190429163239.4874-1-agruenba@redhat.com>
In-Reply-To: <20190429163239.4874-1-agruenba@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 29 Apr 2019 19:46:29 +0200
Message-ID: <CAHc6FU5jgGGsHS9xRDMmssOH3rzDWoRYvrnDM5mHK1ASKc60yA@mail.gmail.com>
To: cluster-devel <cluster-devel@redhat.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, linux-mm@kvack.org,
	Dave Chinner <david@fromorbit.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Mark Syms <Mark.Syms@citrix.com>
Subject: Re: [Cluster-devel] [PATCH v6 1/4] iomap: Clean up
	__generic_write_end calling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Mon, 29 Apr 2019 17:46:56 +0000 (UTC)

On Mon, 29 Apr 2019 at 18:32, Andreas Gruenbacher <agruenba@redhat.com> wrote:
> From: Christoph Hellwig <hch@lst.de>
>
> Move the call to __generic_write_end into iomap_write_end instead of
> duplicating it in each of the three branches.  This requires open coding
> the generic_write_end for the buffer_head case.

Wouldn't it make sense to turn __generic_write_end into a void
function? Right now, it just oddly return its copied argument.

Andreas

